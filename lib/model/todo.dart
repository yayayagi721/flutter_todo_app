import 'package:flutter/foundation.dart';
import 'package:flutter_todo_app/model/location_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const Todo._();
  @HiveType(typeId: 0, adapterName: 'TodoAdapter')
  const factory Todo(
      @HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) DateTime eventAt,
      @HiveField(3) LocationInfo locationInfo,
      @HiveField(4) DateTime createdAt,
      @HiveField(5) DateTime updatedAt,
      @HiveField(6) int? notificationId,
      @HiveField(7) int? notifyInAdvanceVal) = _Todo;

  bool isValidTitle() {
    return 0 < title.length && title.length <= 20;
  }

  bool isValidLocation() {
    return locationInfo != null;
  }
}
