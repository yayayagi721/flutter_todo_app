import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DatetimeInputTab extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formNotifier = ref.read(todoFormStateProvider.notifier);
    final formState = ref.watch(todoFormStateProvider);
    final initDt = DateTime.now().add(Duration(minutes: 1));

    useEffect(() {
      WidgetsBinding.instance!
          .addPostFrameCallback((_) => formNotifier.inputDatetime(initDt));
    }, []);

    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      height: 100,
      child: CupertinoDatePicker(
        minimumDate: DateTime.now(),
        initialDateTime: formState.eventTime ?? initDt,
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
