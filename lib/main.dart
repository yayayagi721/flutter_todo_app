import 'package:flutter_todo_app/model/location_info.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/view/setting_view.dart';
import 'package:flutter_todo_app/view/todo_list_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'const/hive_const.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  Hive.registerAdapter(LocationInfoAdapter());
  await Hive.openBox(BoxName.todoList);
  await Hive.openBox(BoxName.setting);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
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
          '/settingView': (BuildContext context) => SettingView(),
        });
  }
}
