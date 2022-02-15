import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KindSelectButton extends HookConsumerWidget {
  final InputKind inputKind;
  KindSelectButton(this.inputKind);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formPrefState = ref.watch(todoFormPrefStateProvider);
    final formPrefNotifier = ref.read(todoFormPrefStateProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: formPrefState.inputKind == inputKind
            ? Colors.white.withOpacity(0.8)
            : null,
      ),
      child: IconButton(
        icon: Icon(_icon(inputKind),
            color: formPrefState.inputKind == inputKind
                ? Colors.black
                : Colors.black54),
        onPressed: () {
          formPrefNotifier.selectTabKind(inputKind);
        },
      ),
    );
  }

  IconData _icon(InputKind kind) {
    switch (kind) {
      case InputKind.text:
        return Icons.add_comment;
      case InputKind.location:
        return Icons.add_location_sharp;
      case InputKind.datetime:
        return Icons.access_time_filled;
      case InputKind.notifications:
        return Icons.notifications;
      default:
        print('select kind is not exist');
        exit(0);
    }
  }
}
