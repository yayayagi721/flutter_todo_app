import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../Utils/str_utils.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const Todo._();
  const factory Todo(
      String id,
      String title,
      DateTime eventAt,
      double latitude,
      double longitude,
      String? locationName,
      DateTime createdAt,
      DateTime updatedAt) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
