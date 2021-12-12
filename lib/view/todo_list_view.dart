import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/view_model/todo_list_controller.dart';
import 'package:flutter_todo_app/widget/main_drawer.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

final todoListProvider =
    StateNotifierProvider((ref) => TodoListStateController());

class TodoListView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return state.markers.isEmpty
        ? Center(
            child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text("Todo App"),
            ),
            body: ListView(
              children: todoList(),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => {
                showMaterialModalBottomSheet(
                  context: context,
                  builder: (context) => TodoInputForm(),
                )
              },
              tooltip: 'AddTodo',
              child: Icon(Icons.add),
            ),
            drawer: MainDrawer(),
          );
  }

  List<Widget> todoList() {
    final state = useProvider(todoListProvider);
    List<Todo> list = state.todoList;

    DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    Map<String, List<Todo>> todoMap = {};

    list.forEach((todo) {
      String date = outputFormat.format(todo.eventAt);

      if (!todoMap.containsKey(date)) {
        todoMap[date] = <Todo>[];
      }

      todoMap[date]!.add(todo);
    });

    todoMap.keys.forEach((todos) {
      todoMap[todos]!.sort((a, b) {
        return a.eventAt.compareTo(b.eventAt);
      });
    });

    List<Widget> allTodoCards = [];
    var sortKeys = todoMap.keys.toList();
    sortKeys.sort((a, b) => a.compareTo(b));

    sortKeys.forEach((key) {
      allTodoCards = [...allTodoCards, ...todoOnOneDay(key, todoMap[key]!)];
    });

    return allTodoCards;
  }

  List<Widget> todoOnOneDay(String targetDate, List<Todo> todos) {
    final todoCards = todos
        .map((todo) => _contentsCard(
            todo.title,
            DateFormat('hh:mm').format(todo.eventAt),
            todo.locationName ?? "位置情報未読み込み"))
        .toList();
    return <Widget>[_dateLine(targetDate), ...todoCards];
  }

  Widget _dateLine(String targetDate) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      alignment: AlignmentDirectional.center,
      child: Text(
        targetDate,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _contentsCard(String title, String time, String locationName) {
    return Card(
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _title(title),
                SizedBox(
                  height: 5,
                ),
                _subContent(Icons.watch_later, time),
                _subContent(Icons.place, locationName),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _title(String text) {
    return Container(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ));
  }

  Widget _subContent(IconData icon, String text) {
    return Container(
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 5,
            ),
            Text(text)
          ],
        ));
  }
}
