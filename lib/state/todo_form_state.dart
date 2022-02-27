import 'package:flutter_todo_app/model/location_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'todo_form_state.freezed.dart';

@freezed
class TodoFormState with _$TodoFormState {
  const TodoFormState._();
  const factory TodoFormState({
    @Default(null) String? id,
    @Default("") String title,
    @Default(null) LocationInfo? locationInfo,
    @Default(null) DateTime? eventTime,
    @Default(360) int? notifyInAdvanceVal,
  }) = _TodoFormState;

  bool isValidTitle() {
    return 0 < title.length && title.length <= 20;
  }

  bool isValidLocation() {
    return locationInfo != null;
  }

  bool isValidEventTime() {
    return eventTime != null;
  }

  String loededAddress() {
    if (locationInfo == null) {
      return "位置情報未読み込み";
    } else {
      if (locationInfo!.address == null) {
        return "地域名取得中";
      } else {
        return locationInfo!.address!;
      }
    }
  }
}
