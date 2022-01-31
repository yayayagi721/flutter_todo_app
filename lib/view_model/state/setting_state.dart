import 'package:flutter_todo_app/model/location_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'setting_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState(
      int remaindInterval, LocationInfo defaultLocation) = _SettingState;
}
