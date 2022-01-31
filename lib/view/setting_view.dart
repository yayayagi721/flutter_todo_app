import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/repository/location_search_repository_impl.dart';
import 'package:flutter_todo_app/repository/setting_repository_impl.dart';
import 'package:flutter_todo_app/view_model/setting_view_model.dart';
import 'package:flutter_todo_app/widget/location_setting_column.dart';
import 'package:flutter_todo_app/widget/push_setting_column.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingRepositoryProvider = Provider.autoDispose(
  (ref) => SettingRepositoryImpl(),
);

final settingViewModel =
    StateNotifierProvider.autoDispose((ref) => SettingViewModel(ref.read));

class SettingView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: _settingBody(),
    );
  }

  Widget _settingBody() {
    return ListView(
      children: [LocationSettingColumn(), PushSettingColumn()],
    );
  }
}
