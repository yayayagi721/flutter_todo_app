import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/repository/location_search_repository_impl.dart';
import 'package:flutter_todo_app/repository/todo_list_repository_impl.dart';
import 'package:flutter_todo_app/view_model/todo_list_view_model.dart';
import 'package:flutter_todo_app/widget/main_drawer.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

final todoListRepositoryImpl = Provider(
  (ref) => TodoListRepositoryImpl(),
);

final locationSearchProvider = Provider.autoDispose(
  (ref) => LocationSearchRepositoryImpl(),
);

final todoListProvider = StateNotifierProvider((ref) => TodoListStateController(
    ref.read(todoListRepositoryImpl), ref.read(locationSearchProvider)));

class TodoListView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final notifier = useProvider(todoListProvider.notifier);

    useEffect(() {
      notifier.fetch();
      notifier.getAllAddress();
      return () {};
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: ListView(
        children: todoList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            isDismissible: false,
            context: context,
            builder: (context) => TodoInputForm(FormKind.create),
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

    Map<String, List<Todo>> todoListModel = state.todoList;

    //存在する日付でソート
    var sortKeys = todoListModel.keys.toList();
    print(sortKeys);

    sortKeys.sort((a, b) => a.compareTo(b));

    List<Widget> allTodoCards = [];
    sortKeys.forEach((key) {
      allTodoCards = [
        ...allTodoCards,
        ...todoOnOneDay(key, todoListModel[key]!)
      ];
    });

    return allTodoCards;
  }

  List<Widget> todoOnOneDay(String targetDate, List<Todo> todos) {
    final todoCards = todos.map((todo) => _contentsCard(todo)).toList();
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

  Widget _contentsCard(Todo todo) {
    final context = useContext();
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          isDismissible: false,
          context: context,
          builder: (context) => TodoInputForm(FormKind.update, todo),
        );
      },
      child: Card(
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
                  _title(todo.title),
                  SizedBox(
                    height: 5,
                  ),
                  _subContent(Icons.watch_later,
                      DateFormat('hh:mm').format(todo.eventAt)),
                  _subContent(Icons.place, todo.locationName ?? "位置情報未読み込み"),
                ],
              ),
            )
          ],
        ),
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
