import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/view/todo_list_view.dart';
import 'package:flutter_todo_app/view_model/map_provider.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FormSubmitButton extends HookWidget {
  final mapProvider = StateNotifierProvider((ref) => MapProvider());

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
          controller.create(formState.title, formState.eventTime,
              formState.latitude, formState.longitude);
          Navigator.pop(context);
        } else {
          return null;
        }
      },
      child: Text('TextButton'),
    );
  }
}
