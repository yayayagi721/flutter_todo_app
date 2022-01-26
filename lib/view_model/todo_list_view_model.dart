import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/view/todo_list_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../model/todo.dart';
import 'state/todo_list_state.dart';

class TodoListStateController extends StateNotifier<TodoListState> {
  TodoListStateController(this.read) : super(TodoListState());

  final Reader read;

  void fetch() {
    final todoListRepository = read(todoListRepositoryProvider);
    state = state.copyWith(
        isLoaded: true, todoList: _toTodoMap(todoListRepository.getAll()));
  }

  Future create(
      String title,
      DateTime eventAt,
      double latitude,
      double longitude,
      String? locationName,
      DateTime? notificationTime) async {
    final todoListRepository = read(todoListRepositoryProvider);
    final idRepository = read(idRepositoryProvider);

    final todoId = idRepository.createTodoId();
    var notificationId = null;

    //通知時間が入っていたら通知をセットする
    if (notificationTime != null) {
      notificationId = _setNotification(title, eventAt, notificationTime);
    }

    final now = DateTime.now();
    final todo = Todo(todoId, title, eventAt, latitude, longitude, locationName,
        now, now, notificationId);
    final newTodoList = _addTodo(todo, {...state.todoList});
    state = state.copyWith(todoList: newTodoList);
    todoListRepository.create(todo);
    getAddress(todo);
  }

  void update(
      String id,
      String title,
      DateTime eventAt,
      double latitude,
      double longitude,
      String? locationName,
      DateTime? notificationTime) async {
    final todoListRepository = read(todoListRepositoryProvider);

    final todo = todoListRepository.get(id);
    var notificationId = todo.notificationId;

    if (notificationTime != null) {
      notificationId = await _setNotification(
          title, eventAt, notificationTime, notificationId);
    }

    //update時の時間を記録
    final updatedAt = DateTime.now();
    final newTodo = todo.copyWith(
        title: title,
        eventAt: eventAt,
        latitude: latitude,
        longitude: longitude,
        updatedAt: updatedAt,
        locationName: locationName);

    todoListRepository.update(newTodo);
    getAddress(newTodo);
    fetch();
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

  void delete(String id) {
    final todoListRepository = read(todoListRepositoryProvider);

    todoListRepository.delete(id);
    fetch();
  }

  Future getAllAddress() async {
    state.todoList.values.forEach((todos) {
      todos.forEach((todo) async {
        if (todo.locationName == null) {
          await getAddress(todo);
        }
      });
    });
  }

  Future getAddress(Todo todo) async {
    final todoListRepository = read(todoListRepositoryProvider);
    final locationSearchRepository = read(locationSearchRepositoryProvider);

    //住所を取得
    final address = await locationSearchRepository
        .getAddress(LatLng(todo.latitude, todo.longitude));
    final newTodo = todo.copyWith(locationName: address);
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
