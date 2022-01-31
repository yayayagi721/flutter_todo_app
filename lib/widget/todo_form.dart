import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/const/common.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/view_model/todo_form_view_model.dart';
import 'package:flutter_todo_app/widget/datetime_input.dart';
import 'package:flutter_todo_app/widget/location_input_tab.dart';
import 'package:flutter_todo_app/widget/notification_input_tab.dart';
import 'package:flutter_todo_app/widget/text_input.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'form_submit_button.dart';

final todoFormProvider = StateNotifierProvider.autoDispose(
    (ref) => TodoFormStateController(ref.read));

class TodoInputForm extends HookWidget {
  final Todo? todo;
  final FormKind formKind;
  final GlobalKey _key = GlobalKey();

  TodoInputForm(this.formKind, [this.todo]);

  @override
  Widget build(BuildContext context) {
    final notifier = useProvider(todoFormProvider.notifier);

    useEffect(() {
      if (todo != null) {
        notifier.inputId(todo!.id);
        notifier.inputText(todo!.title);
        notifier.inputDatetime(todo!.eventAt);
        notifier.inputLocation(
            todo!.latitude, todo!.longitude, todo!.locationName);
      }

      //FIXME:form種別を変更できてしまうのが良くない
      notifier.setFormKind(formKind);
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
                _inputArea(),
                _selectArea(),
              ],
            ),
          ),
        ));
  }

  Widget _selectArea() {
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
              child: _headerText()),
          _headerIcon()
        ],
      )),
    );
  }

  Widget _headerText() {
    final formState = useProvider(todoFormProvider);

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

  Widget _headerIcon() {
    final formState = useProvider(todoFormProvider);
    final context = useContext();
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

  Widget _inputArea() {
    final state = useProvider(todoFormProvider);

    switch (state.selectedKind) {
      case TabKind.text:
        return TextInput(_key);
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

  Widget _inputKinds() {
    final controller = useProvider(todoFormProvider.notifier);
    final formState = useProvider(todoFormProvider);
    final context = useContext();

    return Row(
      children: [
        _kindButton(TabKind.text),
        _kindButton(TabKind.datetime),
        _kindButton(TabKind.location),
        _kindButton(TabKind.notifications),
      ],
    );
  }

  Widget _kindButton(TabKind kind) {
    final formState = useProvider(todoFormProvider);
    final controller = useProvider(todoFormProvider.notifier);

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
          controller.selectTabKind(kind);
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
