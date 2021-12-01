import 'package:flutter_todo_app/view_model/state/map_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapProvider extends StateNotifier<MapState> {
  MapProvider() : super(MapState());

  void createMarker(LatLng latLng) {
    final newMarkers = {
      Marker(
        markerId: MarkerId("target"),
        position: latLng,
      )
    };
    state = state.copyWith(markers: newMarkers);
  }
}
