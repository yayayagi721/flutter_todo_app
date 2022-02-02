import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DatetimeInput extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final todoFormNotifier = ref.read(todoFormProvider.notifier);
    final todoFormState = ref.watch(todoFormProvider);

    useEffect(() {
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => todoFormNotifier.inputDatetime(now));
    }, []);

    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      height: 100,
      child: CupertinoDatePicker(
        initialDateTime: todoFormState.eventTime ?? now,
        onDateTimeChanged: (DateTime newDt) {
          todoFormNotifier.inputDatetime(newDt);
        },
        use24hFormat: true,
        minuteInterval: 1,
        mode: CupertinoDatePickerMode.dateAndTime,
      ),
    );
  }
}
