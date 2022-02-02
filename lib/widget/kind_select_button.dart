import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KindSelectButton extends HookConsumerWidget {
  final TabKind kind;
  KindSelectButton(this.kind);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(todoFormProvider);
    final formNotifier = ref.read(todoFormProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: formState.selectedKind == kind
            ? Colors.white.withOpacity(0.8)
            : null,
      ),
      child: IconButton(
        icon: Icon(_icon(kind),
            color:
                formState.selectedKind == kind ? Colors.black : Colors.black54),
        onPressed: () {
          formNotifier.selectTabKind(kind);
        },
      ),
    );
  }

  IconData _icon(TabKind kind) {
    switch (kind) {
      case TabKind.text:
        return Icons.add_comment;
      case TabKind.location:
        return Icons.add_location_sharp;
      case TabKind.datetime:
        return Icons.access_time_filled;
      case TabKind.notifications:
        return Icons.notifications;
      default:
        print('select kind is not exist');
        exit(0);
    }
  }
}
