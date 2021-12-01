import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../Utils/str_utils.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const Todo._();
  const factory Todo(String id, String title, DateTime eventAt, double latitude,
      double longitude, DateTime createdAt, DateTime updatedAt) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}

class DefaultId implements Default {
  const DefaultId();

  get defaultValue => () {
        final hoge = StrUtils.createUuid();
        print("hkjhlkjlkjkljkjkjk" + hoge);
        return hoge;
      };
}

class DefaultDt implements Default {
  const DefaultDt();

  get defaultValue => DateTime.now();
}
