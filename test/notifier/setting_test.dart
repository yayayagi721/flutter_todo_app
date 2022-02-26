import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/model/location_info.dart';
import 'package:flutter_todo_app/notifier/setting_state_notifier.dart';
import 'package:flutter_todo_app/repository/location_search_repository.dart';
import 'package:flutter_todo_app/repository/setting_repository.dart';
import 'package:flutter_todo_app/state/setting_state.dart';
import 'package:flutter_todo_app/view/setting_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'setting_test.mocks.dart';

ProviderContainer override(
    {LocationSearchRepository? mockLocationSearchRepo,
    SettingRepository? mockSettingRepo}) {
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

  return ProviderContainer(
    overrides: overrides,
  );
}

final settingStateProvider =
    StateNotifierProvider<SettingStateNotifier, SettingState>(
        (ref) => SettingStateNotifier(ref.read));

@GenerateMocks([LocationSearchRepository, SettingRepository])
void main() {
  group("SettingNotifier", () {
    group("changeDefaultLatLng", () {
      test("正常系", () async {
        final _mockLocationSearchRepository = MockLocationSearchRepository();
        when(_mockLocationSearchRepository.getAddress(any))
            .thenAnswer((realInvocation) async {
          return Future.delayed(Duration(milliseconds: 500), () {
            return "address";
          });
        });
        final _mockSettingRepository = MockSettingRepository();
        when(_mockSettingRepository.setDefaultLocationInfo(any))
            .thenAnswer((realInvocation) => true);
        when(_mockSettingRepository.getRemaindInterval())
            .thenAnswer((realInvocation) => 10);
        when(_mockSettingRepository.getDefaultLocationInfo())
            .thenAnswer((realInvocation) => LocationInfo(1, 2));

        final container = override(
            mockLocationSearchRepo: _mockLocationSearchRepository,
            mockSettingRepo: _mockSettingRepository);
        SettingStateNotifier settingStateNotifier =
            container.read(settingStateProvider.notifier);
        settingStateNotifier.changeDefaultLatLng(LatLng(1, 2));
        SettingState settingState = container.read(settingStateProvider);

        expect(settingState.defaultLocation!.latitude, 1);
        expect(settingState.defaultLocation!.longitude, 2);
        expect(settingState.defaultLocation!.address, null);
        verify(_mockLocationSearchRepository.getAddress(any));
        verify(_mockSettingRepository.setDefaultLocationInfo(any));

        await Future.delayed(const Duration(milliseconds: 1000), () {});

        settingState = container.read(settingStateProvider);

        expect(settingState.defaultLocation!.latitude, 1);
        expect(settingState.defaultLocation!.longitude, 2);
        expect(settingState.defaultLocation!.address, "address");
      });
    });
    group("changeRemaindInterval", () {
      test("正常系", () {
        final _mockSettingRepository = MockSettingRepository();
        when(_mockSettingRepository.setDefaultLocationInfo(any))
            .thenAnswer((realInvocation) => true);
        when(_mockSettingRepository.getRemaindInterval())
            .thenAnswer((realInvocation) => 10);
        when(_mockSettingRepository.getDefaultLocationInfo())
            .thenAnswer((realInvocation) => LocationInfo(1, 2));
        when(_mockSettingRepository.setRemaindInterval(999))
            .thenAnswer((realInvocation) => true);

        final container = override(mockSettingRepo: _mockSettingRepository);
        SettingStateNotifier settingStateNotifier =
            container.read(settingStateProvider.notifier);
        settingStateNotifier.changeRemaindInterval(999);
        SettingState settingState = container.read(settingStateProvider);

        verify(_mockSettingRepository.setRemaindInterval(any));
        expect(settingState.remaindInterval, 999);
      });
    });
  });
}
