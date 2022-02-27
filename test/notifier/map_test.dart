import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/const/common.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/model/location_info.dart';
import 'package:flutter_todo_app/notifier/map_state_notifier.dart';
import 'package:flutter_todo_app/repository/location_search_repository.dart';
import 'package:flutter_todo_app/repository/setting_repository.dart';
import 'package:flutter_todo_app/state/map_state.dart';
import 'package:flutter_todo_app/view/setting_view.dart';
import 'package:flutter_todo_app/widget/location_inputer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'map_test.mocks.dart';

final mapStateProvider =
    StateNotifierProvider.autoDispose<MapStateNotifier, MapState>(
        (ref) => MapStateNotifier(ref.read));

ProviderContainer override(
    {LocationSearchRepository? mockLocationSearchRepo,
    SettingRepository? mockSettingRepo,
    Location? mockLocation}) {
  List<Override> overrides = [];
  if (mockLocationSearchRepo != null) {
    overrides.add(locationSearchRepositoryProvider.overrideWithProvider(
      Provider((ref) => mockLocationSearchRepo),
    ));
  }
  if (mockSettingRepo != null) {
    overrides.add(settingRepositoryProvider.overrideWithProvider(
      Provider.autoDispose((ref) => mockSettingRepo),
    ));
  }
  if (mockLocation != null) {
    overrides.add(locationProvider.overrideWithProvider(
      Provider.autoDispose((ref) => mockLocation),
    ));
  }

  return ProviderContainer(
    overrides: overrides,
  );
}

@GenerateMocks([LocationSearchRepository, SettingRepository, Location])
void main() {
  group("MapNotifier", () {
    group("createMarker", () {
      test("正常値", () {
        final container = ProviderContainer();
        final mapStateNotifier = container.read(mapStateProvider.notifier);
        mapStateNotifier.createMarker(LatLng(1, 1));
        final mapState = container.read(mapStateProvider);

        expect(mapState.markers.length, 1);

        final marker = mapState.markers.first;

        expect(marker.position.latitude, 1);
        expect(marker.position.longitude, 1);

        mapStateNotifier.createMarker(LatLng(2, 2));

        final changedMapState = container.read(mapStateProvider);

        expect(changedMapState.markers.length, 1);

        final changedMarker = changedMapState.markers.first;

        expect(changedMarker.position.latitude, 2);
        expect(changedMarker.position.longitude, 2);
      });
    });
    group("init", () {
      test("initLatLngが渡される、デフォルト位置情報が存在する", () {
        //位置情報は使える
        final mockLocation = MockLocation();
        when(mockLocation.serviceEnabled())
            .thenAnswer((realInvocation) => Future.value(true));
        when(mockLocation.hasPermission()).thenAnswer(
            (realInvocation) => Future.value(PermissionStatus.granted));

        final mockSettingRepository = MockSettingRepository();
        when(mockSettingRepository.getDefaultLocationInfo())
            .thenAnswer((realInvocation) => LocationInfo(1, 1));

        final container = override(
            mockLocation: mockLocation, mockSettingRepo: mockSettingRepository);

        final mapStateNotifier = container.read(mapStateProvider.notifier);
        mapStateNotifier.init(LatLng(2, 2));

        final mapState = container.read(mapStateProvider);

        expect(mapState.markers.length, 1);

        final marker = mapState.markers.first;

        expect(marker.position.latitude, 2);
        expect(marker.position.longitude, 2);
      });
      test("initLatLngが渡される、デフォルト位置情報が存在しない", () {
        final mockLocation = MockLocation();
        when(mockLocation.serviceEnabled())
            .thenAnswer((realInvocation) => Future.value(true));
        when(mockLocation.hasPermission()).thenAnswer(
            (realInvocation) => Future.value(PermissionStatus.granted));

        final mockSettingRepository = MockSettingRepository();
        when(mockSettingRepository.getDefaultLocationInfo())
            .thenAnswer((realInvocation) => null);

        final container = override(
            mockLocation: mockLocation, mockSettingRepo: mockSettingRepository);

        final mapStateNotifier = container.read(mapStateProvider.notifier);
        mapStateNotifier.init(LatLng(2, 2));

        final mapState = container.read(mapStateProvider);

        expect(mapState.markers.length, 1);

        final marker = mapState.markers.first;

        expect(marker.position.latitude, 2);
        expect(marker.position.longitude, 2);
      });
      test("initLatLngが渡されない、デフォルト位置情報が存在する", () {
        final mockLocation = MockLocation();
        when(mockLocation.serviceEnabled())
            .thenAnswer((realInvocation) => Future.value(true));
        when(mockLocation.hasPermission()).thenAnswer(
            (realInvocation) => Future.value(PermissionStatus.granted));

        final mockSettingRepository = MockSettingRepository();
        when(mockSettingRepository.getDefaultLocationInfo())
            .thenAnswer((realInvocation) => LocationInfo(1, 1));

        final container = override(
            mockLocation: mockLocation, mockSettingRepo: mockSettingRepository);

        final mapStateNotifier = container.read(mapStateProvider.notifier);
        mapStateNotifier.init();

        final mapState = container.read(mapStateProvider);

        expect(mapState.markers.length, 1);

        final marker = mapState.markers.first;

        expect(marker.position.latitude, 1);
        expect(marker.position.longitude, 1);
      });
      test("initLatLngが渡されない、デフォルト位置情報が存在しない", () async {
        final mockLocation = MockLocation();
        when(mockLocation.serviceEnabled())
            .thenAnswer((realInvocation) => Future.value(true));
        when(mockLocation.hasPermission()).thenAnswer(
            (realInvocation) => Future.value(PermissionStatus.granted));

        Map<String, dynamic> locationdDataMap = {
          "latitude": 50.0,
          "longitude": 50.0
        };
        when(mockLocation.getLocation()).thenAnswer((realInvocation) =>
            Future.value(LocationData.fromMap(locationdDataMap)));

        final mockSettingRepository = MockSettingRepository();
        when(mockSettingRepository.getDefaultLocationInfo())
            .thenAnswer((realInvocation) => null);

        final container = override(
            mockLocation: mockLocation, mockSettingRepo: mockSettingRepository);

        final mapStateNotifier = container.read(mapStateProvider.notifier);
        await mapStateNotifier.init();

        final mapState = container.read(mapStateProvider);

        expect(mapState.markers.length, 1);

        final marker = mapState.markers.first;

        expect(marker.position.latitude, 50);
        expect(marker.position.longitude, 50);
      });
      test("location serviceが利用できない", () async {
        final mockLocation = MockLocation();
        when(mockLocation.serviceEnabled())
            .thenAnswer((realInvocation) => Future.value(false));
        when(mockLocation.requestService())
            .thenAnswer((realInvocation) => Future.value(false));

        final mockSettingRepository = MockSettingRepository();
        when(mockSettingRepository.getDefaultLocationInfo())
            .thenAnswer((realInvocation) => null);

        final container = override(
            mockLocation: mockLocation, mockSettingRepo: mockSettingRepository);

        final mapStateNotifier = container.read(mapStateProvider.notifier);
        await mapStateNotifier.init();

        final mapState = container.read(mapStateProvider);

        expect(mapState.markers.length, 1);

        final marker = mapState.markers.first;

        expect(marker.position.latitude, CommonConst.initPosLat);
        expect(marker.position.longitude, CommonConst.initPosLng);
      });
      test("locationの権限が足りない", () async {
        final mockLocation = MockLocation();
        when(mockLocation.serviceEnabled())
            .thenAnswer((realInvocation) => Future.value(false));
        when(mockLocation.requestService())
            .thenAnswer((realInvocation) => Future.value(false));
        when(mockLocation.hasPermission()).thenAnswer(
            (realInvocation) => Future.value(PermissionStatus.denied));
        when(mockLocation.requestPermission()).thenAnswer(
            (realInvocation) => Future.value(PermissionStatus.denied));

        final mockSettingRepository = MockSettingRepository();
        when(mockSettingRepository.getDefaultLocationInfo())
            .thenAnswer((realInvocation) => null);

        final container = override(
            mockLocation: mockLocation, mockSettingRepo: mockSettingRepository);

        final mapStateNotifier = container.read(mapStateProvider.notifier);
        await mapStateNotifier.init();

        final mapState = container.read(mapStateProvider);

        expect(mapState.markers.length, 1);

        final marker = mapState.markers.first;

        expect(marker.position.latitude, CommonConst.initPosLat);
        expect(marker.position.longitude, CommonConst.initPosLng);
      });
    });
    group("getMarkerLatLng", () {
      test("配列にマーカー1件", () {
        final container = ProviderContainer();
        final mapStateNotifier = container.read(mapStateProvider.notifier);
        mapStateNotifier.createMarker(LatLng(1, 1));
        final latLng = mapStateNotifier.getMarkerLatLng();
        expect(latLng.hashCode, LatLng(1, 1).hashCode);
      });
    });
  });
}
