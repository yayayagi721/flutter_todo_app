import 'package:clock/clock.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/model/location_info.dart';
import 'package:flutter_todo_app/state/todo_list_state.dart';
import 'package:flutter_todo_app/view/todo_list_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../model/todo.dart';

class TodoListStateNotifier extends StateNotifier<TodoListState> {
  TodoListStateNotifier(this.read) : super(TodoListState());

  final Reader read;

  void onSwitchOldLoadable() {
    state = state.copyWith(isOldLoadable: !state.isOldLoadable);
    fetch();
  }

  void fetch() {
    final todoListRepository = read(todoListRepositoryProvider);
    if (state.isOldLoadable) {
      state = state.copyWith(
          isLoaded: true, todoList: _toTodoMap(todoListRepository.getAll()));
    } else {
      state = state.copyWith(
          isLoaded: true,
          todoList:
              _toTodoMap(todoListRepository.getTodosAfterDt(clock.now())));
    }
  }

  Future create(String title, DateTime eventAt, LocationInfo locationInfo,
      int? notifyInAdvanceVal) async {
    final todoListRepository = read(todoListRepositoryProvider);
    final idRepository = read(idRepositoryProvider);

    final todoId = idRepository.createTodoId();
    var notificationId = null;

    //予定の何分前に通知するための値が入っている時
    if (notifyInAdvanceVal != null) {
      final durationed = eventAt.add(Duration(minutes: -notifyInAdvanceVal));
      //通知時刻が現在時刻より後の時、通知をセットする
      if (durationed.isAfter(clock.now())) {
        notificationId = await _setNotification(title, eventAt,
            eventAt.add(Duration(minutes: -notifyInAdvanceVal)));
      }
    }

    //通知時間が入っていたら通知をセットする
    final now = clock.now();
    final todo = Todo(todoId, title, eventAt, locationInfo, now, now,
        notificationId, notifyInAdvanceVal);
    final newTodoList = _addTodo(todo, {...state.todoList});
    state = state.copyWith(todoList: newTodoList);
    todoListRepository.create(todo);
    _getAddress(todo);
  }

  Future update(String id, String title, DateTime eventAt,
      LocationInfo locationInfo, int? notifyInAdvanceVal) async {
    final todoListRepository = read(todoListRepositoryProvider);

    final todo = todoListRepository.get(id);
    var notificationId = todo.notificationId;

    //予定の何分前に通知するための値が入っている時
    if (notifyInAdvanceVal != null) {
      final durationed = eventAt.add(Duration(minutes: -notifyInAdvanceVal));
      //通知時刻が現在時刻より後の時、通知をセットする
      if (durationed.isAfter(clock.now())) {
        await _setNotification(
            title,
            eventAt,
            eventAt.add(Duration(minutes: -notifyInAdvanceVal)),
            notificationId);
      }
    }

    //update時の時間を記録
    final updatedAt = clock.now();
    final newTodo = todo.copyWith(
        title: title,
        eventAt: eventAt,
        locationInfo: locationInfo,
        updatedAt: updatedAt,
        notifyInAdvanceVal: notifyInAdvanceVal);

    todoListRepository.update(newTodo);
    _getAddress(newTodo);
    fetch();
  }

  Future delete(Todo todo) async {
    final todoListRepository = read(todoListRepositoryProvider);

    if (todo.notificationId != null) {
      final notificationsRepository =
          await read(notificationsRepositoryProvider.future);
      await notificationsRepository.cancelNotification(todo.notificationId!);
    }

    todoListRepository.delete(todo.id);
    fetch();
  }

  Future _getAllAddress() async {
    state.todoList.values.forEach((todos) {
      todos.forEach((todo) async {
        if (todo.locationInfo.address == null) {
          await _getAddress(todo);
        }
      });
    });
  }

  Future<int> _setNotification(
      String title, DateTime eventAt, DateTime notificationTime,
      [int? notificationId]) async {
    final notificationsRepository =
        await read(notificationsRepositoryProvider.future);
    //通知IDがnullの場合新規作成とみなし、IDを発行する
    if (notificationId == null) {
      final idRepository = read(idRepositoryProvider);
      notificationId = idRepository.createNotificationId();
    }

    notificationsRepository.setNotification(
        notificationId,
        "予定リマインド",
        '''${DateFormat('yyyy年M月d日 HH:mm').format(eventAt)}
${title}''',
        notificationTime);
    return notificationId;
  }

  Future _getAddress(Todo todo) async {
    final todoListRepository = read(todoListRepositoryProvider);
    final locationSearchRepository = read(locationSearchRepositoryProvider);

    final locationInfo = todo.locationInfo;

    //住所を取得
    final address = await locationSearchRepository
        .getAddress(LatLng(locationInfo.latitude, locationInfo.longitude));
    final newLocationInfo = locationInfo.copyWith(address: address);

    final newTodo = todo.copyWith(locationInfo: newLocationInfo);
    todoListRepository.update(newTodo);
    fetch();
  }

  Map<String, List<Todo>> _toTodoMap(List<Todo> todoList) {
    //日付別でTodoを格納するMapを作成
    Map<String, List<Todo>> todoMap = {};
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');

    todoList.forEach((todo) {
      String date = dateFormat.format(todo.eventAt);
      if (!todoMap.containsKey(date)) {
        todoMap[date] = <Todo>[];
      }
      todoMap[date]!.add(todo);
    });

    //map内にTodoのListが存在しない場合、新たに追加する

    //同じ日付内のtodoをソート
    todoMap.keys.forEach((todos) {
      _sortTodoList(todoMap[todos]!);
    });

    //存在する日付でソート
    var sortKeys = todoMap.keys.toList();
    sortKeys.sort((a, b) => a.compareTo(b));

    return todoMap;
  }

  //FIXME:破壊的なソート
  void _sortTodoList(List<Todo> todoList) {
    todoList.sort((a, b) {
      return a.eventAt.compareTo(b.eventAt);
    });
  }

  Map<String, List<Todo>> _addTodo(Todo todo, Map<String, List<Todo>> todoMap) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    String date = dateFormat.format(todo.eventAt);
    //map内にTodoのListが存在しない場合、新たに追加する
    if (!todoMap.containsKey(date)) {
      todoMap[date] = <Todo>[];
    }

    todoMap[date]!.add(todo);

    _sortTodoList(todoMap[date]!);

    return todoMap;
  }
}
