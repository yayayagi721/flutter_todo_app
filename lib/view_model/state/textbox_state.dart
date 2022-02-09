import 'package:freezed_annotation/freezed_annotation.dart';
part 'textbox_state.freezed.dart';

@freezed
class TextBoxState with _$TextBoxState {
  const factory TextBoxState({@Default("") String text}) = _TextBoxState;
}
