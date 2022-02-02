import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HeaderText extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(todoFormProvider);

    final headerStr;
    switch (formState.inputKind) {
      case InputKind.text:
        headerStr = "予定の内容";
        break;
      case InputKind.location:
        headerStr = "予定の場所";
        break;
      case InputKind.datetime:
        headerStr = "予定の日時";
        break;
      case InputKind.notifications:
        headerStr = "通知時間";
        break;
      default:
        print('select kind is not exist');
        exit(0);
    }

    return Text(
      headerStr,
      style: TextStyle(color: Colors.black38),
    );
  }
}

class HeaderIcon extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(todoFormProvider);

    if (formState.isUpKeyboard) {
      return IconButton(
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          icon: Icon(Icons.done));
    } else {
      return IconButton(
          onPressed: () async {
            bool isExit = await _onWillPopDialog(context);
            if (isExit) {
              Navigator.pop(context);
            }
          },
          icon: Icon(Icons.clear));
    }
  }

  Future<bool> _onWillPopDialog(BuildContext context) async {
    bool isExit = await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Text("入力した内容を破棄して戻りますか？"),
          actions: <Widget>[
            // ボタン領域
            TextButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context, false),
            ),
            TextButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        );
      },
    );

    return isExit;
  }
}
