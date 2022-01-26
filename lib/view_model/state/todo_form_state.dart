import 'package:flutter_todo_app/const/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'todo_form_state.freezed.dart';

@freezed
class TodoFormState with _$TodoFormState {
  const TodoFormState._();
  const factory TodoFormState({
    @Default(FormKind.create) FormKind formKind,
    @Default(TabKind.text) TabKind selectedKind,
    @Default(null) String? id,
    @Default("") String title,
    @Default(null) double? latitude,
    @Default(null) double? longitude,
    @Default(null) String? locationName,
    @Default(null) DateTime? eventTime,
    @Default(null) DateTime? notificationTime,
    @Default(false) bool isFocus,
  }) = _TodoFormState;

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
