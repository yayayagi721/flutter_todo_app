import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/const/common.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/repository/location_search_repository_impl.dart';
import 'package:flutter_todo_app/view_model/todo_form_view_model.dart';
import 'package:flutter_todo_app/widget/datetime_input.dart';
import 'package:flutter_todo_app/widget/location_input_tab.dart';
import 'package:flutter_todo_app/widget/notification_input_tab.dart';
import 'package:flutter_todo_app/widget/text_input.dart';
import 'package:hexcolor/hexcolor.dart';

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

    return Focus(
        child: Container(
      padding: EdgeInsets.all(5),
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
    ));
  }

  Widget _selectArea() {
    return Container(
      height: lyoutConst.menuBarHeight,
      padding: EdgeInsets.all(5),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _inputKinds(),
          FormSubmitButton(),
        ],
      )),
    );
  }

  Widget _headerArea() {
    return Container(
      height: lyoutConst.formHeaderHeight,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [_headerIcon()],
      )),
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

    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.add_comment,
            color: formState.isValidTitle()
                ? HexColor("#009A00")
                : HexColor("#FF0058"),
          ),
          onPressed: () {
            controller.selectTabKind(TabKind.text);
          },
        ),
        IconButton(
          icon: Icon(Icons.access_time_filled,
              color: formState.isValidEventTime()
                  ? HexColor("#009A00")
                  : HexColor("#FF0058")),
          onPressed: () {
            controller.selectTabKind(TabKind.datetime);
          },
        ),
        IconButton(
          icon: Icon(Icons.add_location_sharp,
              color: formState.isValidLocation()
                  ? HexColor("#009A00")
                  : HexColor("#FF0058")),
          onPressed: () {
            controller.selectTabKind(TabKind.location);
          },
        ),
        IconButton(
          icon: Icon(Icons.notifications,
              color: formState.isValidLocation()
                  ? HexColor("#009A00")
                  : HexColor("#FF0058")),
          onPressed: () {
            controller.selectTabKind(TabKind.notifications);
          },
        ),
      ],
    );
  }
}
