import 'package:clock/clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DatetimeInputTab extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formNotifier = ref.read(todoFormStateProvider.notifier);
    final formState = ref.watch(todoFormStateProvider);

    final minDate = clock.now();
    var initDt;

    useEffect(() {
      if (formState.eventTime == null ||
          minDate.isAfter(formState.eventTime!)) {
        initDt = clock.now().add(Duration(minutes: 1));
      } else {
        initDt = formState.eventTime;
      }
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => formNotifier.inputDatetime(initDt));
    }, []);

    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      height: 100,
      child: CupertinoDatePicker(
        minimumDate: minDate,
        initialDateTime: initDt,
        onDateTimeChanged: (DateTime newDt) {
          formNotifier.inputDatetime(newDt);
        },
        use24hFormat: true,
        minuteInterval: 1,
        mode: CupertinoDatePickerMode.dateAndTime,
      ),
    );
  }
}
