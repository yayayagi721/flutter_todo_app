import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/view/todo_list_view.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FormSubmitButton extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useProvider(todoListProvider.notifier);
    final formState = useProvider(todoFormProvider);
    return Row(
      children: [
        ElevatedButton(
          child: Text('作成'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: !_isSubmittable()
              ? null
              : () {
                  switch (formState.formKind) {
                    case FormKind.create:
                      controller.create(
                          formState.title,
                          formState.eventTime,
                          formState.latitude,
                          formState.longitude,
                          formState.locationName);
                      break;
                    case FormKind.update:
                      controller.update(
                          formState.id,
                          formState.title,
                          formState.eventTime,
                          formState.latitude,
                          formState.longitude,
                          formState.locationName);
                      break;
                  }
                  Navigator.pop(context);
                },
        )
      ],
    );
  }

  bool _isSubmittable() {
    final formState = useProvider(todoFormProvider);

    return formState.isValidTitle() &&
        formState.isValidLocation() &&
        formState.isValidEventTime();
  }
}
