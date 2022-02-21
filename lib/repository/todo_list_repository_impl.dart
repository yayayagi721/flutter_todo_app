import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/repository/todo_list_repository.dart';
import 'package:hive/hive.dart';

class TodoListRepositoryImpl implements TodoListRepository {
  final boxName;
  TodoListRepositoryImpl(this.boxName);

  @override
  List<Todo> getAll() {
    final todoList = Hive.box(boxName).values.toList();
    return todoList.cast<Todo>();
  }

  @override
  Todo create(Todo todo) {
    Hive.box(boxName).put(todo.id, todo);
    return todo;
  }

  @override
  bool delete(String id) {
    Hive.box(boxName).delete(id);
    return true;
  }

  @override
  Todo get(String id) {
    return Hive.box(boxName).get(id);
  }

  @override
  Todo update(Todo todo) {
    Hive.box(boxName).put(todo.id, todo);
    return todo;
  }

  @override
  List<Todo> getTodosAfterDt(DateTime dt) {
    final todoList = Hive.box(boxName)
        .values
        .where((todo) => todo.eventAt.isAfter(dt))
        .toList();
    return todoList.cast<Todo>();
  }
}
