import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/const/common.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/view_model/state/todo_form_state.dart';
import 'package:flutter_todo_app/view_model/todo_form_state_notifier.dart';
import 'package:flutter_todo_app/widget/datetime_input.dart';
import 'package:flutter_todo_app/widget/location_input_tab.dart';
import 'package:flutter_todo_app/widget/notification_input_tab.dart';
import 'package:flutter_todo_app/widget/text_input.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'form_submit_button.dart';

final todoFormProvider =
    StateNotifierProvider.autoDispose<TodoFormStateNotifier, TodoFormState>(
        (ref) => TodoFormStateNotifier(ref.read));

class TodoInputForm extends HookConsumerWidget {
  final Todo? todo;
  final FormKind formKind;
  final GlobalKey _key = GlobalKey();

  TodoInputForm(this.formKind, [this.todo]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FormNotifier = ref.read(todoFormProvider.notifier);

    useEffect(() {
      if (todo != null) {
        FormNotifier.inputId(todo!.id);
        FormNotifier.inputText(todo!.title);
        FormNotifier.inputDatetime(todo!.eventAt);
        FormNotifier.inputLocation(
            todo!.latitude, todo!.longitude, todo!.locationName);
      }

      //FIXME:form種別を変更できてしまうのが良くない
      FormNotifier.setFormKind(formKind);
      return () {};
    }, const []);

    return SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Focus(
          child: Container(
            // key: _key,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _headerArea(),
                FormMainArea(),
                _footerArea(),
              ],
            ),
          ),
        ));
  }

  Widget _footerArea() {
    final context = useContext();
    return Container(
        height: lyoutConst.menuBarHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _inputKinds(),
            FormSubmitButton(),
          ],
        )));
  }

  Widget _headerArea() {
    return Container(
      height: lyoutConst.formHeaderHeight,
      decoration: BoxDecoration(
        border: Border(
          bottom: const BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: HeaderText()),
          HeaderIcon()
        ],
      )),
    );
  }

  Widget _inputKinds() {
    return Row(
      children: [
        KindSelectButton(TabKind.text),
        KindSelectButton(TabKind.datetime),
        KindSelectButton(TabKind.location),
        KindSelectButton(TabKind.notifications),
      ],
    );
  }
}

class KindSelectButton extends HookConsumerWidget {
  final TabKind kind;
  KindSelectButton(this.kind);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(todoFormProvider);
    final formNotifier = ref.read(todoFormProvider.notifier);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: formState.selectedKind == kind
            ? Colors.white.withOpacity(0.8)
            : null,
      ),
      child: IconButton(
        icon: Icon(_icon(kind),
            color:
                formState.selectedKind == kind ? Colors.black : Colors.black54),
        onPressed: () {
          formNotifier.selectTabKind(kind);
        },
      ),
    );
  }

  IconData _icon(TabKind kind) {
    switch (kind) {
      case TabKind.text:
        return Icons.add_comment;
      case TabKind.location:
        return Icons.add_location_sharp;
      case TabKind.datetime:
        return Icons.access_time_filled;
      case TabKind.notifications:
        return Icons.notifications;
      default:
        print('select kind is not exist');
        exit(0);
    }
  }
}

class HeaderText extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(todoFormProvider);

    final headerStr;
    switch (formState.selectedKind) {
      case TabKind.text:
        headerStr = "タイトル";
        break;
      case TabKind.location:
        headerStr = "予定がある場所";
        break;
      case TabKind.datetime:
        headerStr = "予定がある日時";
        break;
      case TabKind.notifications:
        headerStr = "通知時間";
        break;
      default:
        print('select kind is not exist');
        exit(0);
    }

    return Text(
      headerStr,
      style: TextStyle(color: Colors.black38),
    );
  }
}

class FormMainArea extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(todoFormProvider);

    switch (formState.selectedKind) {
      case TabKind.text:
        return TextInput();
      case TabKind.location:
        return LocationInputTab();
      case TabKind.datetime:
        return DatetimeInput();
      case TabKind.notifications:
        return NotificationInputTab();
      default:
        print('select kind is not exist');
        exit(0);
    }
  }
}

class HeaderIcon extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(todoFormProvider);

    if (formState.isFocus) {
      return IconButton(
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          icon: Icon(Icons.done));
    } else {
      return IconButton(
          onPressed: () async {
            bool isExit = await _onWillPopDialog(context);
            if (isExit) {
              Navigator.pop(context);
            }
          },
          icon: Icon(Icons.clear));
    }
  }

  Future<bool> _onWillPopDialog(BuildContext context) async {
    bool isExit = await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Text("入力した内容を破棄して戻りますか？"),
          actions: <Widget>[
            // ボタン領域
            TextButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context, false),
            ),
            TextButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        );
      },
    );

    return isExit;
  }
}
