import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationInputTab extends HookWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController? _textEditingController;

    final controller = useProvider(todoFormProvider.notifier);
    final state = useProvider(todoFormProvider);
    final focusNode = useFocusNode();

    useEffect(() {
      _textEditingController = TextEditingController(text: state.title);
      focusNode.addListener(() {
        controller.onFocusChange(focusNode.hasFocus);
      });
    }, [focusNode]);
    var hours = [];
    var minutes = [];

    for (var i = 0; i < 24; i++) {
      hours.add(i);
    }

    for (var i = 0; i < 60; i++) {
      minutes.add(i);
    }

    return Container(
        height: 100,
        child: Expanded(
          child: Row(
            children: [
              Expanded(
                child: CupertinoPicker(
                  looping: true,
                  itemExtent: 30,
                  scrollController: FixedExtentScrollController(initialItem: 0),
                  onSelectedItemChanged: (index) async {
                    final timeOfDay = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay(hour: 1, minute: 20),
                      initialEntryMode: TimePickerEntryMode.input,
                      builder: (BuildContext context, Widget? child) {
                        return MediaQuery(
                          data: MediaQuery.of(context)
                              .copyWith(alwaysUse24HourFormat: true),
                          child: child!,
                        );
                      },
                    );
                  },
                  children: hours.map((hour) => _pickerContent(hour)).toList(),
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  looping: true,
                  itemExtent: 30,
                  scrollController: FixedExtentScrollController(initialItem: 0),
                  onSelectedItemChanged: (index) {},
                  children:
                      minutes.map((minute) => _pickerContent(minute)).toList(),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _pickerContent(int number) {
    return Align(
      alignment: Alignment.center,
      child: Text(number.toString()),
    );
  }
}
