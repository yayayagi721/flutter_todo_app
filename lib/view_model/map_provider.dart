import 'dart:async';

import 'package:flutter_todo_app/const/common.dart';
import 'package:flutter_todo_app/view_model/state/map_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapProvider extends StateNotifier<MapState> {
  MapProvider() : super(MapState());

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

  Future init() async {
    Location location = new Location();
    //TODO:デフォルト値を設定から変えられるようにする
    final defaultLatLng =
        LatLng(CommonConst.initPosLat, CommonConst.initPosLng);

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    //パーミッションが足りないと、デフォルト位置にマーカが刺さる
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        createMarker(defaultLatLng);
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        createMarker(defaultLatLng);
      }
    }

    final _locationData = await location.getLocation();
    LatLng latlng;

    if (_locationData.latitude == null || _locationData.longitude == null) {
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
}
