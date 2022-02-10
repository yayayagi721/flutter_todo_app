import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_todo_app/model/location_info.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/repository/id_repository_impl.dart';
import 'package:flutter_todo_app/repository/location_search_repository_impl.dart';
import 'package:flutter_todo_app/repository/notifications_repository_impl.dart';
import 'package:flutter_todo_app/view/setting_view.dart';
import 'package:flutter_todo_app/view/todo_list_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'const/hive_const.dart';

final locationSearchRepositoryProvider = Provider(
  (ref) => LocationSearchRepositoryImpl(),
);

final idRepositoryProvider = Provider.autoDispose(
  (ref) => IdRepositoryImpl(),
);

final flutterLocalNotificationsProvider = FutureProvider((ref) async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
    requestSoundPermission: true,
    requestBadgePermission: true,
    requestAlertPermission: true,
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    iOS: initializationSettingsIOS,
    android: null,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
  return flutterLocalNotificationsPlugin;
});

final notificationsRepositoryProvider = FutureProvider((ref) async {
  final flutterLocalNotificationsPlugin =
      await ref.read(flutterLocalNotificationsProvider.future);

  return NotificationsRepositoryImpl(flutterLocalNotificationsPlugin, ref.read);
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  Hive.registerAdapter(LocationInfoAdapter());
  await Hive.openBox(BoxName.todoList);
  await Hive.openBox(BoxName.setting);
  await Hive.openBox(BoxName.id);

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ja', 'JP'), // 日本語
        ],
        initialRoute: "/listView",
        routes: {
          '/listView': (BuildContext context) => TodoListView(),
          '/settingView': (BuildContext context) => SettingView()
        });
  }
}
