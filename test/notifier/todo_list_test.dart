import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/model/location_info.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/notifier/todo_list_state_notifier.dart';
import 'package:flutter_todo_app/repository/id_repository.dart';
import 'package:flutter_todo_app/repository/location_search_repository.dart';
import 'package:flutter_todo_app/repository/notifications_repository.dart';
import 'package:flutter_todo_app/repository/todo_list_repository.dart';
import 'package:flutter_todo_app/repository/todo_list_repository_impl.dart';
import 'package:flutter_todo_app/state/todo_list_state.dart';
import 'package:flutter_todo_app/view/todo_list_view.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'todo_list_test.mocks.dart';

final todoListStateProvider =
    StateNotifierProvider<TodoListStateNotifier, TodoListState>(
        (ref) => TodoListStateNotifier(ref.read));

ProviderContainer override(
    {TodoListRepository? mockTodoListRepo,
    IdRepository? mockIdRepo,
    NotificationsRepository? mockNotificationsRepo,
    LocationSearchRepository? mockLocationSearchRepo}) {
  List<Override> overrides = [];
  if (mockTodoListRepo != null) {
    overrides.add(todoListRepositoryProvider.overrideWithProvider(
      Provider((ref) => mockTodoListRepo),
    ));
  }
  if (mockIdRepo != null) {
    overrides.add(idRepositoryProvider.overrideWithProvider(
      Provider.autoDispose((ref) => mockIdRepo),
    ));
  }
  if (mockNotificationsRepo != null) {
    overrides.add(notificationsRepositoryProvider.overrideWithProvider(
      FutureProvider((ref) => mockNotificationsRepo),
    ));
  }
  if (mockLocationSearchRepo != null) {
    overrides.add(locationSearchRepositoryProvider.overrideWithProvider(
      Provider((ref) => mockLocationSearchRepo),
    ));
  }

  return ProviderContainer(
    overrides: overrides,
  );
}

Future<void> initialiseHive() async {
  final path = Directory.current.path;
  Hive.init(path);
  Hive.registerAdapter(TodoAdapter());
  Hive.registerAdapter(LocationInfoAdapter());
  Hive.deleteFromDisk();
}

@GenerateMocks([
  TodoListRepository,
  IdRepository,
  NotificationsRepository,
  LocationSearchRepository
])
void main() async {
  await initialiseHive();
  group("TodoListStateNotifier", () {
    group("onSwitchOldLoadable", () {
      test("正常系", () {
        final _mockTodoListRepository = MockTodoListRepository();
        final dt1 = DateTime.parse("2021-02-20");
        final damyTodo1 =
            Todo("id", "title", dt1, LocationInfo(1, 2), dt1, dt1, null, null);
        when(_mockTodoListRepository.getAll())
            .thenAnswer((realInvocation) => [damyTodo1]);

        final dt2 = DateTime.parse("2021-02-19");
        final damyTodo2 = Todo(
            "id2", "title2", dt2, LocationInfo(3, 4), dt2, dt2, null, null);
        when(_mockTodoListRepository.getTodosAfterDt(any))
            .thenAnswer((realInvocation) => [damyTodo2]);
        when(_mockTodoListRepository.update(any))
            .thenAnswer((realInvocation) => damyTodo1);

        final container = override(mockTodoListRepo: _mockTodoListRepository);
        final todoListStateNotifier =
            container.read(todoListStateProvider.notifier);

        var todoListState = container.read(todoListStateProvider);
        expect(todoListState.isOldLoadable, false);

        todoListStateNotifier.onSwitchOldLoadable();
        todoListState = container.read(todoListStateProvider);

        expect(todoListState.isOldLoadable, true);
        expect(todoListState.todoList.entries.length, 1);
        expect(todoListState.todoList.keys.length, 1);
        expect(todoListState.todoList.keys.toList()[0], "2021-02-20");
        expect(todoListState.todoList.entries.toList()[0].value[0].hashCode,
            damyTodo1.hashCode);
      });
    });
    group("fetch", () {
      test("正常系", () {
        final _mockTodoListRepository = MockTodoListRepository();
        final dt1 = DateTime.parse("2021-02-20");
        final damyTodo1 =
            Todo("id", "title", dt1, LocationInfo(1, 2), dt1, dt1, null, null);
        when(_mockTodoListRepository.getAll())
            .thenAnswer((realInvocation) => [damyTodo1]);

        final dt2 = DateTime.parse("2021-02-19");
        final damyTodo2 = Todo(
            "id2", "title2", dt2, LocationInfo(3, 4), dt2, dt2, null, null);
        when(_mockTodoListRepository.getTodosAfterDt(any))
            .thenAnswer((realInvocation) => [damyTodo2]);
        when(_mockTodoListRepository.update(any))
            .thenAnswer((realInvocation) => damyTodo1);

        final container = override(mockTodoListRepo: _mockTodoListRepository);

        final todoListStateNotifier =
            container.read(todoListStateProvider.notifier);
        todoListStateNotifier.fetch();

        var todoListState = container.read(todoListStateProvider);

        expect(todoListState.todoList.entries.length, 1);
        expect(todoListState.todoList.keys.length, 1);
        expect(todoListState.todoList.keys.toList()[0], "2021-02-19");
        expect(todoListState.todoList.entries.toList()[0].value[0].hashCode,
            damyTodo2.hashCode);

        todoListStateNotifier.onSwitchOldLoadable();

        todoListState = container.read(todoListStateProvider);
        expect(todoListState.todoList.entries.length, 1);
        expect(todoListState.todoList.keys.length, 1);
        expect(todoListState.todoList.keys.toList()[0], "2021-02-20");
        expect(todoListState.todoList.entries.toList()[0].value[0].hashCode,
            damyTodo1.hashCode);
      });
    });
    group("create", () {
      final boxName = "test_todolist";

      setUp(() async {
        await Hive.openBox(boxName);
      });

      tearDown(() async {
        // 最後に必ずクリア
        await Hive.deleteFromDisk();
      });

      test("notifyInAdvanceValあり", () async {
        //withClockで包むとHiveBoxがCloseしてしまうため、中で初期化
        final _mockLocationSearchRepository = MockLocationSearchRepository();
        when(_mockLocationSearchRepository.getAddress(any))
            .thenAnswer((realInvocation) => Future.value("address"));

        final _mockIdRepository = MockIdRepository();
        var i = 0;
        when(_mockIdRepository.createTodoId())
            .thenAnswer((realInvocation) => ["todo_1", "todo_2"][i++]);
        var j = 0;
        when(_mockIdRepository.createNotificationId())
            .thenAnswer((realInvocation) => [1, 2][j++]);

        final _mockTodoListRepository = TodoListRepositoryImpl(boxName);

        final _mockNotificationsRepository = MockNotificationsRepository();
        when(_mockNotificationsRepository.setNotification(any, any, any, any))
            .thenAnswer((realInvocation) => Future.value(true));

        final container = override(
            mockTodoListRepo: _mockTodoListRepository,
            mockIdRepo: _mockIdRepository,
            mockLocationSearchRepo: _mockLocationSearchRepository,
            mockNotificationsRepo: _mockNotificationsRepository);

        final todoListStateNotifier =
            container.read(todoListStateProvider.notifier);

        await todoListStateNotifier.create(
            "todo_title", DateTime.parse("2030-02-20"), LocationInfo(1, 2), 10);

        var todoListState = container.read(todoListStateProvider);

        expect(todoListState.todoList.entries.length, 1);
        expect(todoListState.todoList.keys.length, 1);
        expect(todoListState.todoList.keys.toList()[0], "2030-02-20");
        final todo = todoListState.todoList.entries.toList()[0].value[0];
        expect(todo.eventAt, DateTime.parse("2030-02-20"));
        expect(todo.title, "todo_title");
        expect(todo.id, "todo_1");
        expect(todo.locationInfo.latitude, 1);
        expect(todo.locationInfo.longitude, 2);
        expect(todo.notificationId, 1);

        await todoListStateNotifier.create("add_todo_title",
            DateTime.parse("2030-02-21"), LocationInfo(3, 4), 20);

        todoListState = container.read(todoListStateProvider);

        expect(todoListState.todoList.entries.length, 2);
        expect(todoListState.todoList.keys.length, 2);
        expect(todoListState.todoList.keys.toList()[0], "2030-02-20");
        expect(todoListState.todoList.entries.toList()[1].value.length, 1);
        final add_todo = todoListState.todoList.entries.toList()[1].value[0];
        expect(add_todo.eventAt, DateTime.parse("2030-02-21"));
        expect(add_todo.title, "add_todo_title");
        expect(add_todo.id, "todo_2");
        expect(add_todo.locationInfo.latitude, 3);
        expect(add_todo.locationInfo.longitude, 4);
        expect(add_todo.notificationId, 2);
      });
      test("notifyInAdvanceValなし", () async {
        //withClockで包むとHiveBoxがCloseしてしまうため、中で初期化
        final _mockLocationSearchRepository = MockLocationSearchRepository();
        when(_mockLocationSearchRepository.getAddress(any))
            .thenAnswer((realInvocation) => Future.value("address"));

        final _mockIdRepository = MockIdRepository();
        when(_mockIdRepository.createTodoId()).thenReturn("todo_1");
        when(_mockIdRepository.createNotificationId()).thenReturn(1);

        final _mockTodoListRepository = TodoListRepositoryImpl(boxName);

        final _mockNotificationsRepository = MockNotificationsRepository();
        when(_mockNotificationsRepository.setNotification(any, any, any, any))
            .thenAnswer((realInvocation) => Future.value(true));

        final container = override(
            mockTodoListRepo: _mockTodoListRepository,
            mockIdRepo: _mockIdRepository,
            mockLocationSearchRepo: _mockLocationSearchRepository,
            mockNotificationsRepo: _mockNotificationsRepository);

        final todoListStateNotifier =
            container.read(todoListStateProvider.notifier);

        await todoListStateNotifier.create("todo_title",
            DateTime.parse("2030-02-20"), LocationInfo(1, 2), null);

        var todoListState = container.read(todoListStateProvider);

        expect(todoListState.todoList.entries.length, 1);
        expect(todoListState.todoList.keys.length, 1);
        expect(todoListState.todoList.keys.toList()[0], "2030-02-20");
        final todo = todoListState.todoList.entries.toList()[0].value[0];
        expect(todo.eventAt, DateTime.parse("2030-02-20"));
        expect(todo.title, "todo_title");
        expect(todo.id, "todo_1");
        expect(todo.locationInfo.latitude, 1);
        expect(todo.locationInfo.longitude, 2);
        expect(todo.notificationId, null);
      });
      test("過去時刻を追加", () async {
        await Hive.openBox(boxName);
        final _mockLocationSearchRepository = MockLocationSearchRepository();
        when(_mockLocationSearchRepository.getAddress(any))
            .thenAnswer((realInvocation) => Future.value("address"));

        final _mockIdRepository = MockIdRepository();
        when(_mockIdRepository.createTodoId()).thenReturn("todo_1");
        when(_mockIdRepository.createNotificationId()).thenReturn(1);

        final _mockTodoListRepository = TodoListRepositoryImpl(boxName);

        final _mockNotificationsRepository = MockNotificationsRepository();
        when(_mockNotificationsRepository.setNotification(any, any, any, any))
            .thenAnswer((realInvocation) => Future.value(true));

        final container = override(
            mockTodoListRepo: _mockTodoListRepository,
            mockIdRepo: _mockIdRepository,
            mockLocationSearchRepo: _mockLocationSearchRepository,
            mockNotificationsRepo: _mockNotificationsRepository);

        final todoListStateNotifier =
            container.read(todoListStateProvider.notifier);

        await todoListStateNotifier.create(
            "todo_title", DateTime.parse("2020-01-20"), LocationInfo(1, 2), 10);

        var todoListState = container.read(todoListStateProvider);

        expect(todoListState.todoList.entries.length, 0);
        expect(todoListState.todoList.keys.length, 0);
      });
    });
    group("update", () {
      final boxName = "test_todolist";
      setUp(() async {
        await Hive.openBox(boxName);
      });
      tearDown(() async {
        // 最後に必ずクリア
        await Hive.deleteFromDisk();
      });
      test("予定日時が未来", () async {
        final _mockLocationSearchRepository = MockLocationSearchRepository();
        when(_mockLocationSearchRepository.getAddress(any))
            .thenAnswer((realInvocation) => Future.value("address"));
        final _mockTodoListRepository = TodoListRepositoryImpl(boxName);

        final dt1 = DateTime.parse("2025-01-20");
        final damyTodo1 = Todo(
            "sample_id", "title", dt1, LocationInfo(1, 2), dt1, dt1, 1, 10);
        _mockTodoListRepository.create(damyTodo1);

        final _mockIdRepository = MockIdRepository();
        when(_mockIdRepository.createNotificationId()).thenReturn(1);

        final _mockNotificationsRepository = MockNotificationsRepository();
        when(_mockNotificationsRepository.setNotification(any, any, any, any))
            .thenAnswer((realInvocation) => Future.value(true));

        final container = override(
            mockTodoListRepo: _mockTodoListRepository,
            mockIdRepo: _mockIdRepository,
            mockLocationSearchRepo: _mockLocationSearchRepository,
            mockNotificationsRepo: _mockNotificationsRepository);
        final todoListStateNotifier =
            container.read(todoListStateProvider.notifier);

        final dt2 = DateTime.parse("2030-02-21");

        todoListStateNotifier.fetch();

        await todoListStateNotifier.update(
            "sample_id", "updated_title", dt2, LocationInfo(3, 4), 99);

        var todoListState = container.read(todoListStateProvider);

        expect(todoListState.todoList.entries.length, 1);
        expect(todoListState.todoList.keys.length, 1);
        expect(todoListState.todoList.keys.toList()[0], "2030-02-21");
        final todo = todoListState.todoList.entries.toList()[0].value[0];
        expect(todo.eventAt, DateTime.parse("2030-02-21"));
        expect(todo.title, "updated_title");
        expect(todo.id, "sample_id");
        expect(todo.locationInfo.latitude, 3);
        expect(todo.locationInfo.longitude, 4);
        expect(todo.notifyInAdvanceVal, 99);
        expect(todo.notificationId, 1);
      });
    });
    group("delete", () {
      final boxName = "test_todolist";

      setUp(() async {
        await Hive.openBox(boxName);
      });

      tearDown(() async {
        // 最後に必ずクリア
        await Hive.deleteFromDisk();
      });
      test("notificationIdあり", () async {
        final _mockLocationSearchRepository = MockLocationSearchRepository();
        when(_mockLocationSearchRepository.getAddress(any))
            .thenAnswer((realInvocation) => Future.value("address"));
        final _mockNotificationsRepository = MockNotificationsRepository();
        when(_mockNotificationsRepository.cancelNotification(1))
            .thenAnswer((realInvocation) => Future.value(true));
        final _mockTodoListRepository = TodoListRepositoryImpl(boxName);

        final container = override(
            mockTodoListRepo: _mockTodoListRepository,
            mockNotificationsRepo: _mockNotificationsRepository);

        final todoListStateNotifier =
            container.read(todoListStateProvider.notifier);

        final dt1 = DateTime.parse("2030-02-20");
        final damyTodo1 = Todo(
            "sample_id", "title", dt1, LocationInfo(1, 2), dt1, dt1, 1, 10);

        _mockTodoListRepository.create(damyTodo1);

        todoListStateNotifier.fetch();

        var todoListState = container.read(todoListStateProvider);

        expect(todoListState.todoList.entries.length, 1);
        expect(todoListState.todoList.keys.length, 1);

        await todoListStateNotifier.delete(damyTodo1);

        todoListState = container.read(todoListStateProvider);

        expect(todoListState.todoList.entries.length, 0);
        expect(todoListState.todoList.keys.length, 0);
        verify(_mockNotificationsRepository.cancelNotification(1));
      });
      test("notificationIdなし", () async {
        final _mockLocationSearchRepository = MockLocationSearchRepository();
        when(_mockLocationSearchRepository.getAddress(any))
            .thenAnswer((realInvocation) => Future.value("address"));
        final _mockNotificationsRepository = MockNotificationsRepository();
        when(_mockNotificationsRepository.cancelNotification(1))
            .thenAnswer((realInvocation) => Future.value(true));
        final _mockTodoListRepository = TodoListRepositoryImpl(boxName);

        final container = override(
            mockTodoListRepo: _mockTodoListRepository,
            mockNotificationsRepo: _mockNotificationsRepository);

        final todoListStateNotifier =
            container.read(todoListStateProvider.notifier);

        final dt1 = DateTime.parse("2030-02-20");
        final damyTodo1 = Todo("sample_id", "title", dt1, LocationInfo(1, 2),
            dt1, dt1, null, null);

        _mockTodoListRepository.create(damyTodo1);

        todoListStateNotifier.fetch();

        var todoListState = container.read(todoListStateProvider);

        expect(todoListState.todoList.entries.length, 1);
        expect(todoListState.todoList.keys.length, 1);

        await todoListStateNotifier.delete(damyTodo1);

        todoListState = container.read(todoListStateProvider);

        expect(todoListState.todoList.entries.length, 0);
        expect(todoListState.todoList.keys.length, 0);
        verifyNever(_mockNotificationsRepository.cancelNotification(1));
      });
    });
  });
}
