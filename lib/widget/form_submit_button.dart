import 'package:flutter/material.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/state/todo_form_state.dart';
import 'package:flutter_todo_app/view/todo_list_view.dart';
import 'package:flutter_todo_app/widget/toast.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormSubmitButton extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListNotifier = ref.read(todoListStateProvider.notifier);
    final formState = ref.watch(todoFormStateProvider);
    final formPrefState = ref.watch(todoFormPrefStateProvider);
    return Row(
      children: [
        ElevatedButton(
          child: Text('作成'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            if (!_validation(context, formState)) return;

            switch (formPrefState.saveType) {
              case SaveType.create:
                todoListNotifier.create(formState.title, formState.eventTime!,
                    formState.locationInfo!, formState.notifyInAdvanceVal);
                break;
              case SaveType.update:
                todoListNotifier.update(
                    formState.id!,
                    formState.title,
                    formState.eventTime!,
                    formState.locationInfo!,
                    formState.notifyInAdvanceVal);
                break;
            }
            Navigator.pop(context);
          },
        )
      ],
    );
  }

  bool _validation(BuildContext context, TodoFormState formState) {
    var massege;

    if (!formState.isValidTitle()) {
      massege = "予定の内容を入力してください";
    } else if (!formState.isValidLocation()) {
      massege = "予定の場所を入力してください";
    } else if (!formState.isValidEventTime()) {
      massege = "予定の時間を入力してください";
    }

    if (massege != null) {
      CommonToast.showErorrToast(context, massege);
      return false;
    }
    return true;
  }
}
