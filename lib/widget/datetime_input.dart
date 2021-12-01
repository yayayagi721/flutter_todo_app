import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DatetimeInput extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useProvider(todoFormProvider.notifier);
    final state = useProvider(todoFormProvider);
    return Container(
      height: 100,
      child: CupertinoDatePicker(
        initialDateTime: state.eventTime,
        onDateTimeChanged: (DateTime newDt) {
          controller.inputDatetime(newDt);
        },
        use24hFormat: true,
        minuteInterval: 1,
        mode: CupertinoDatePickerMode.dateAndTime,
      ),
    );
  }
}
