import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/const/hive_const.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/notifier/todo_list_state_notifier.dart';
import 'package:flutter_todo_app/repository/todo_list_repository.dart';
import 'package:flutter_todo_app/repository/todo_list_repository_impl.dart';
import 'package:flutter_todo_app/state/todo_list_state.dart';
import 'package:flutter_todo_app/widget/todo_card.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

final todoListRepositoryProvider = Provider<TodoListRepository>(
  (ref) => TodoListRepositoryImpl(BoxName.todoList),
);

final itemScrollControllerProvider = Provider(
  (ref) => ItemScrollController(),
);

final todoListStateProvider =
    StateNotifierProvider.autoDispose<TodoListStateNotifier, TodoListState>(
        (ref) => TodoListStateNotifier(ref.read));

class TodoListView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListNotifier = ref.read(todoListStateProvider.notifier);
    final todoListState = ref.watch(todoListStateProvider);
    final itemScrollController = ref.read(itemScrollControllerProvider);

    useEffect(() {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        todoListNotifier.fetch();
      });
      return () {};
    }, const []);

    final widgetList = todoList(todoListState.todoList, ref);

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
      body: !todoListState.isLoaded
          ? Center(
              child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)),
            )
          : ScrollablePositionedList.builder(
              itemScrollController: itemScrollController,
              padding: EdgeInsets.only(left: 15, right: 15),
              itemCount: widgetList.length,
              initialScrollIndex: 1,
              itemBuilder: (BuildContext context, int index) {
                return widgetList[index];
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            isDismissible: false,
            enableDrag: false,
            context: context,
            builder: (context) => TodoInputForm(SaveType.create),
          )
        },
        child: Icon(Icons.add),
      ),
    );
  }

  List<Widget> todoList(Map<String, List<Todo>> todoListModel, WidgetRef ref) {
    //存在する日付でソート
    var sortKeys = todoListModel.keys.toList();
    sortKeys.sort((a, b) => a.compareTo(b));
    final todoListState = ref.watch(todoListStateProvider);

    List<Widget> children = [];
    if (!todoListState.isOldLoadable) {
      children.add(_oldLoadButton(ref));
    }

    sortKeys.forEach((key) {
      children = [...children, _todoOnOneDay(key, todoListModel[key]!)];
    });
    children.add(SizedBox(height: 50));

    return children;
  }

  Widget _oldLoadButton(WidgetRef ref) {
    final todoListNotifier = ref.read(todoListStateProvider.notifier);
    final todoListState = ref.watch(todoListStateProvider);
    final itemScrollController = ref.read(itemScrollControllerProvider);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: const BorderSide(
            color: Colors.black12,
          ),
          bottom: const BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
      child: TextButton(
        onPressed: () {
          final crrentLength = todoListState.todoList.length - 1;
          todoListNotifier.onSwitchOldLoadable();
          itemScrollController.jumpTo(
              index: todoListState.todoList.length - crrentLength);
        },
        child: Text("過去の予定も確認する"),
      ),
    );
  }

  Widget _todoOnOneDay(String targetDate, List<Todo> todos) {
    final datetime = DateTime.parse(targetDate);
    final formatter = new DateFormat('yyyy年M月d日', "ja_JP");
    final formatted = formatter.format(datetime); // DateからString
    final todoCards = todos.map((todo) => TodoCard(todo)).toList();
    return Column(
      children: [_dateLine(formatted), ...todoCards],
    );
  }

  Widget _dateLine(String targetDate) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      alignment: AlignmentDirectional.centerStart,
      padding: EdgeInsets.only(top: 20),
      child: Text(
        targetDate,
        style: TextStyle(fontSize: 16, color: Colors.black54),
      ),
    );
  }
}
