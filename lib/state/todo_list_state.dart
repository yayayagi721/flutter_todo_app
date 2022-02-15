import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import '/model/todo.dart';

part 'todo_list_state.freezed.dart';

@freezed
class TodoListState with _$TodoListState {
  const factory TodoListState({
    @Default(false) bool isLoaded,
    @Default(false) bool isOldLoadable,
    @Default({}) Map<String, List<Todo>> todoList,
  }) = _TodoListState;
}
