import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/view/todo_list_view.dart';
import 'package:flutter_todo_app/view_model/map_view_model.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FormSubmitButton extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useProvider(todoListProvider.notifier);
    final formState = useProvider(todoFormProvider);
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.cyan),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      onPressed: () {
        if (formState.isValidTitle() &&
            formState.isValidLocation() &&
            formState.isValidEventTime()) {
          switch (formState.formKind) {
            case FormKind.create:
              controller.create(formState.title, formState.eventTime,
                  formState.latitude, formState.longitude);
              break;
            case FormKind.update:
              controller.update(formState.id, formState.title,
                  formState.eventTime, formState.latitude, formState.longitude);
              break;
          }
          Navigator.pop(context);
        } else {
          return null;
        }
      },
      child: Text('TextButton'),
    );
  }
}
