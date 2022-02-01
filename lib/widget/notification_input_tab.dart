import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationInputTab extends StatelessWidget {
  //選択できる通知時間。ラベル/分数。
  final Map<String, int> pickableValue = {
    '10分前': 10,
    '30分前': 30,
    '1時間前': 60,
    '3時間前': 180,
    '6時間前': 360,
    '12時間前': 720,
    '24時間前': 1440,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Wrap(
          alignment: WrapAlignment.start,
          children: pickableValue.keys
              .toList()
              .map((e) => NotificationSetBotton(e, pickableValue[e]!))
              .toList()),
    );
  }
}

class NotificationSetBotton extends HookConsumerWidget {
  //ボタン押下された際にvalue分前に設定する
  final int value;
  //ボタンのラベル
  final String label;
  NotificationSetBotton(this.label, this.value);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(todoFormProvider);
    final formNotifier = ref.read(todoFormProvider.notifier);
    final context = useContext();

    final selected = formState.notifyInAdvanceVal == value;
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: OutlinedButton(
        child: SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.done),
              Text(
                this.label,
                style: TextStyle(
                    color: selected
                        ? Theme.of(context).primaryColor.withOpacity(0.7)
                        : Colors.black45),
              )
            ],
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.only(left: 5, right: 5),
          primary: selected ? Theme.of(context).primaryColor : Colors.black45,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(
              color: selected
                  ? Theme.of(context).primaryColor.withOpacity(0.7)
                  : Colors.black45),
        ),
        onPressed: () {
          if (selected) {
            formNotifier.inputNotifyInAdvanceVal(null);
          } else {
            formNotifier.inputNotifyInAdvanceVal(value);
          }
        },
      ),
    );
  }
}
