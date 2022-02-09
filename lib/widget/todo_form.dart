import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/const/common.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/view_model/state/todo_form_state.dart';
import 'package:flutter_todo_app/view_model/todo_form_state_notifier.dart';
import 'package:flutter_todo_app/widget/datetime_input_tab.dart';
import 'package:flutter_todo_app/widget/header_components.dart';
import 'package:flutter_todo_app/widget/kind_select_button.dart';
import 'package:flutter_todo_app/widget/location_input_tab.dart';
import 'package:flutter_todo_app/widget/notification_input_tab.dart';
import 'package:flutter_todo_app/widget/text_input_tab.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'form_submit_button.dart';

final todoFormProvider =
    StateNotifierProvider.autoDispose<TodoFormStateNotifier, TodoFormState>(
        (ref) => TodoFormStateNotifier(ref.read));

class TodoInputForm extends HookConsumerWidget {
  final Todo? todo;
  final SaveType saveType;

  TodoInputForm(this.saveType, [this.todo]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FormNotifier = ref.read(todoFormProvider.notifier);

    useEffect(() {
      if (todo != null) {
        FormNotifier.inputId(todo!.id);
        FormNotifier.inputText(todo!.title);
        FormNotifier.inputDatetime(todo!.eventAt);
        FormNotifier.inputLocation(todo!.locationInfo.latitude,
            todo!.locationInfo.longitude, todo!.locationInfo.address);
      }

      //FIXME:form種別を変更できてしまうのが良くない
      FormNotifier.setFormKind(saveType);
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
        KindSelectButton(InputKind.text),
        KindSelectButton(InputKind.datetime),
        KindSelectButton(InputKind.location),
        KindSelectButton(InputKind.notifications),
      ],
    );
  }
}

class FormMainArea extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(todoFormProvider);

    switch (formState.inputKind) {
      case InputKind.text:
        return TextInputTab();
      case InputKind.location:
        return LocationInputTab();
      case InputKind.datetime:
        return DatetimeInputTab();
      case InputKind.notifications:
        return NotificationInputTab();
      default:
        print('select kind is not exist');
        exit(0);
    }
  }
}
