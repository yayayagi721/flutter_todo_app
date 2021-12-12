import 'package:flutter_todo_app/const/hive_const.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/repository/todo_list_repository.dart';
import 'package:hive/hive.dart';

class TodoListRepositoryImpl implements TodoListRepository {
  TodoListRepositoryImpl();

  @override
  List<Todo> getAll() {
    final todoList = Hive.box(BoxName.todoList).values.toList();
    return todoList.cast<Todo>();
  }

  @override
  Todo create(Todo todo) {
    Hive.box(BoxName.todoList).put(todo.id, todo);
    return todo;
  }

  @override
  bool delete(String id) {
    Hive.box(BoxName.todoList).delete(id);
    return true;
  }

  @override
  Todo get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Todo update(Todo todo) {
    Hive.box(BoxName.todoList).put(todo.id, todo);
    return todo;
  }
}
