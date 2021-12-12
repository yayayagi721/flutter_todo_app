import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'textbox_state.freezed.dart';

@freezed
class TextBoxState with _$TextBoxState {
  const factory TextBoxState({@Default("") String text}) = _TextBoxState;
}
