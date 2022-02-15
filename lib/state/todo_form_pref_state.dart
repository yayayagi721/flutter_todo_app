import 'package:flutter_todo_app/const/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo_form_pref_state.freezed.dart';

@freezed
class TodoFromPrefState with _$TodoFromPrefState {
  const factory TodoFromPrefState({
    @Default(SaveType.create) SaveType saveType,
    @Default(InputKind.text) InputKind inputKind,
    @Default(false) bool isUpKeyboard,
  }) = _TodoFromPrefState;
}
