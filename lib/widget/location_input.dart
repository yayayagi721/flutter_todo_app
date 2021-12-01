import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/const/common.dart';
import 'package:flutter_todo_app/view_model/map_provider.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mapProvider = StateNotifierProvider((ref) => MapProvider());

class LocationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [Map(), LatLngOkButton()]);
  }
}

class Map extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(mapProvider);
    final mapNotifier = useProvider(mapProvider.notifier);
    final Completer<GoogleMapController> _controller = Completer();

    return GoogleMap(
      mapType: MapType.hybrid,
      markers: state.markers,
      initialCameraPosition: CameraPosition(
          target: LatLng(CommonConst.initPosLat, CommonConst.initPosLng),
          zoom: 0.5),
      onMapCreated: _controller.complete,
      onTap: (latLng) => mapNotifier.createMarker(latLng),
    );
  }
}

class LatLngOkButton extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final formNotifier = useProvider(todoFormProvider.notifier);
    final mapState = useProvider(mapProvider);

    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
          onPressed: () {
            //常に長さ1のため先頭にしかみなくて良い
            Marker marker = mapState.markers.elementAt(0);
            Navigator.pop(context,
                LatLng(marker.position.latitude, marker.position.longitude));
          },
          child: Text("huga")),
    );
  }
}
