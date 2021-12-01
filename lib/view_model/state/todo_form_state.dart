import 'package:flutter_todo_app/const/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'todo_form_state.freezed.dart';

@freezed
class TodoFormState with _$TodoFormState {
  const TodoFormState._();
  const factory TodoFormState(
      {@Default(Kind.text) Kind selectedKind,
      @Default("") String title,
      @Default(null) double? latitude,
      @Default(null) double? longitude,
      @Default(null) DateTime? eventTime}) = _TodoFormState;

  bool isValidTitle() {
    return 0 < title.length && title.length <= 20;
  }

  bool isValidLocation() {
    return latitude != null && longitude != null;
  }

  bool isValidEventTime() {
    return eventTime != null;
  }
}
