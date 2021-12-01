import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
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
    final list = state.todoList;
    final hoge =
        list.map((todo) => _contentsCard(todo.title, todo.id)).toList();
    final huga = [_dateLine(DateTime.now()), ...hoge];
    return huga.cast<Widget>();
  }

  Widget _dateLine(DateTime dt) {
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    String date = outputFormat.format(dt);
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      alignment: AlignmentDirectional.center,
      child: Text(
        date,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _contentsCard(
    String title,
    String text,
  ) {
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
                _title("ラーメン生男"),
                SizedBox(
                  height: 5,
                ),
                _subContent(Icons.watch_later, "piyo"),
                _subContent(Icons.place, "huga"),
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
          "huga",
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
            Text("huga")
          ],
        ));
  }
}
