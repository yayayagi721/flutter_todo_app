import 'package:flutter/foundation.dart';
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
      @HiveField(3) double latitude,
      @HiveField(4) double longitude,
      @HiveField(5) String? locationName,
      @HiveField(6) DateTime createdAt,
      @HiveField(7) DateTime updatedAt) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
