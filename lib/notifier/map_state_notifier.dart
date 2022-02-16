import 'dart:async';

import 'package:flutter_todo_app/const/common.dart';
import 'package:flutter_todo_app/state/map_state.dart';
import 'package:flutter_todo_app/view/setting_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapStateNotifier extends StateNotifier<MapState> {
  MapStateNotifier(this.read) : super(MapState());

  final Reader read;
  final Completer<GoogleMapController> controller = Completer();

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
    Location location = new Location();
    //TODO:デフォルト値を設定から変えられるようにする
    final settingRepository = read(settingRepositoryProvider);
    final defaultLocationInfo = settingRepository.getDefaultLocationInfo();
    LatLng? defaultLatLng;
    if (defaultLocationInfo != null) {
      defaultLatLng =
          LatLng(defaultLocationInfo.latitude, defaultLocationInfo.longitude);
    }

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    //パーミッションが足りないと、デフォルト位置にマーカが刺さる
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        createMarker(LatLng(CommonConst.initPosLat, CommonConst.initPosLng));
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        createMarker(LatLng(CommonConst.initPosLat, CommonConst.initPosLng));
      }
    }

    final _locationData = await location.getLocation();
    LatLng latlng;
    if (defaultLatLng != null) {
      latlng = defaultLatLng;
    } else if (initLatLng != null) {
      latlng = initLatLng;
    } else if (_locationData.latitude == null ||
        _locationData.longitude == null) {
      latlng = LatLng(CommonConst.initPosLat, CommonConst.initPosLng);
    } else {
      latlng = LatLng(_locationData.latitude!, _locationData.longitude!);
    }

    createMarker(latlng);
    state = state.copyWith(controller: Completer());

    return true;
  }

  Future changeCameraPosition(LatLng latLng) async {
    if (state.controller != null) {
      Completer<GoogleMapController> completer = state.controller!;
      final GoogleMapController controller = await completer.future;

      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 14)));
    }
  }

  LatLng getMarkerLatLng() {
    Marker marker = state.markers.elementAt(0);
    return LatLng(marker.position.latitude, marker.position.longitude);
  }
}
