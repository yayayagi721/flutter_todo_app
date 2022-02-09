import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/repository/todo_list_repository_impl.dart';
import 'package:flutter_todo_app/view_model/state/todo_list_state.dart';
import 'package:flutter_todo_app/view_model/todo_list_view_model.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final todoListRepositoryProvider = Provider(
  (ref) => TodoListRepositoryImpl(),
);

final todoListProvider =
    StateNotifierProvider.autoDispose<TodoListStateController, TodoListState>(
        (ref) => TodoListStateController(ref.read));

class TodoListView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListNotifier = ref.read(todoListProvider.notifier);
    final todoListState = ref.watch(todoListProvider);

    useEffect(() {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        todoListNotifier.fetch();
        todoListNotifier.getAllAddress();
      });
      return () {};
    }, const []);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamed('/settingView');
            },
          )
        ],
        title: Text("Todo App"),
      ),
      body: ListView(
        children: todoList(todoListState.todoList),
        padding: EdgeInsets.only(left: 15, right: 15),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            isDismissible: false,
            context: context,
            builder: (context) => TodoInputForm(SaveType.create),
          )
        },
        tooltip: 'AddTodo',
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> todoList(Map<String, List<Todo>> todoListModel) {
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
    final datetime = DateTime.parse(targetDate);
    final formatter = new DateFormat('yyyy年M月d日', "ja_JP");
    final formatted = formatter.format(datetime); // DateからString
    final todoCards = todos.map((todo) => _contentsCard(todo)).toList();
    return <Widget>[_dateLine(formatted), ...todoCards];
  }

  Widget _dateLine(String targetDate) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        targetDate,
        style: TextStyle(fontSize: 16, color: Colors.black54),
      ),
    );
  }

  Widget _contentsCard(Todo todo) {
    final context = useContext();
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          enableDrag: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          isDismissible: false,
          context: context,
          builder: (context) => TodoInputForm(SaveType.update, todo),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(15),
        ),
        child: IntrinsicHeight(
          child: Row(children: [
            Container(
                width: 10,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                )),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _title(todo.title),
                  SizedBox(
                    height: 5,
                  ),
                  _description(todo.locationInfo.address ?? "位置情報未読み込み"),
                  SizedBox(
                    height: 5,
                  ),
                  _subContent(Icons.watch_later,
                      DateFormat('HH:mm').format(todo.eventAt)),
                  // _subContent(Icons.place, todo.locationName ?? "位置情報未読み込み"),
                ],
              ),
            ))
          ]),
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Container(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ));
  }

  Widget _description(String text) {
    return Container(
        alignment: AlignmentDirectional.centerStart,
        child:
            Text(text, style: TextStyle(fontSize: 14, color: Colors.black54)));
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
