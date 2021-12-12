import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_state.freezed.dart';

@freezed
class MapState with _$MapState {
  const factory MapState(
      {@Default(null) Completer<GoogleMapController>? controller,
      @Default({}) Set<Marker> markers}) = _MapState;
}
