import 'package:flutter/material.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/view/todo_list_view.dart';
import 'package:flutter_todo_app/view_model/state/todo_form_state.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormSubmitButton extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(todoListProvider.notifier);
    final formState = ref.watch(todoFormProvider);
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

            switch (formState.formKind) {
              case FormKind.create:
                controller.create(
                    formState.title,
                    formState.eventTime!,
                    formState.latitude!,
                    formState.longitude!,
                    formState.locationName,
                    formState.notifyInAdvanceVal);
                break;
              case FormKind.update:
                controller.update(
                    formState.id!,
                    formState.title,
                    formState.eventTime!,
                    formState.latitude!,
                    formState.longitude!,
                    formState.locationName,
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
    final fToast = FToast();
    fToast.init(context);

    var massege;

    if (!formState.isValidTitle()) {
      massege = "予定の内容を入力してください";
    } else if (!formState.isValidLocation()) {
      massege = "予定の場所を入力してください";
    } else if (!formState.isValidEventTime()) {
      massege = "予定の時間を入力してください";
    }

    if (massege != null) {
      fToast.showToast(
        child: _toast(massege),
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
      );
      return false;
    }
    return true;
  }

  Widget _toast(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.close),
          SizedBox(
            width: 12.0,
          ),
          Text(text),
        ],
      ),
    );
  }
}
