import 'dart:async';

import 'package:flutter_todo_app/const/common.dart';
import 'package:flutter_todo_app/state/map_state.dart';
import 'package:flutter_todo_app/view/setting_view.dart';
import 'package:flutter_todo_app/widget/location_inputer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapStateNotifier extends StateNotifier<MapState> {
  MapStateNotifier(this.read) : super(MapState());

  final Reader read;

  void createMarker(LatLng latLng) {
    final newMarkers = {
      Marker(
        markerId: MarkerId("target"),
        position: latLng,
      )
    };
    state = state.copyWith(markers: newMarkers);
  }

  Future init([LatLng? initLatLng]) async {
    final settingRepository = read(settingRepositoryProvider);
    final location = read(locationProvider);
    final defaultLocationInfo = settingRepository.getDefaultLocationInfo();

    LatLng latlng;
    if (initLatLng != null) {
      //引数で位置情報を渡された場合
      latlng = initLatLng;
    } else if (defaultLocationInfo != null) {
      //デフォルト位置情報が設定されている場合
      latlng =
          LatLng(defaultLocationInfo.latitude, defaultLocationInfo.longitude);
    } else {
      //どちらでもない場合は、現在位置を取得
      final isEnable = await _locationIsEnable(location);
      if (isEnable) {
        //それでも取得できなかった場合、固定値を入れる
        final _locationData = await location.getLocation();
        latlng = LatLng(_locationData.latitude!, _locationData.longitude!);
      } else {
        latlng = LatLng(CommonConst.initPosLat, CommonConst.initPosLng);
      }
    }

    createMarker(latlng);
    state = state.copyWith(controller: Completer());

    return true;
  }

  Future<bool> _locationIsEnable(Location location) async {
    var _serviceEnabled;
    var _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }

    return true;
  }

  Future changeCameraPosition(LatLng latLng) async {
    if (state.controller != null) return;
    Completer<GoogleMapController> completer = state.controller!;
    final GoogleMapController controller = await completer.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 14)));
  }

  LatLng getMarkerLatLng() {
    Marker marker = state.markers.elementAt(0);
    return LatLng(marker.position.latitude, marker.position.longitude);
  }
}
