import 'package:flutter_todo_app/model/todo.dart';

abstract class TodoListRepository {
  List<Todo> getAll();
  List<Todo> getTodosAfterDt(DateTime dt);
  Todo get(String id);
  Todo create(Todo todo);
  Todo update(Todo todo);
  bool delete(String id);
}
