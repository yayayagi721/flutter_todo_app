import 'package:flutter_todo_app/utils/str_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/todo.dart';
import 'state/todo_list_state.dart';

class TodoListStateController extends StateNotifier<TodoListState> {
  TodoListStateController() : super(TodoListState());

  void create(
      String title, DateTime eventAt, double latitude, double longitude) {
    final id = StrUtils.createUuid();
    final now = DateTime.now();
    final todo = Todo(id, title, eventAt, latitude, longitude, now, now);
    final newTodoList = [...state.todoList, todo];
    state = state.copyWith(todoList: newTodoList);
  }

  // TODO:一旦実装。冗長なので、もっといい方法あるかも
  void update(String id, String title, DateTime eventTime, double latitude,
      double longitude) {
    final oldTodo = state.todoList.firstWhere((todo) => todo.id == id);
    //update時の時間を記録
    final updatedAt = DateTime.now();
    final newTodo = oldTodo.copyWith(
        title: title,
        eventAt: eventTime,
        latitude: latitude,
        longitude: longitude,
        updatedAt: updatedAt);
    final targetList = state.todoList.where((todo) => todo.id != id).toList();
    final newTodoList = [...targetList, newTodo];
    state = state.copyWith(todoList: newTodoList);
  }

  void delete(String id) {
    final newTodoList = state.todoList.where((todo) => todo.id != id).toList();
    state = state.copyWith(todoList: newTodoList);
  }
}
