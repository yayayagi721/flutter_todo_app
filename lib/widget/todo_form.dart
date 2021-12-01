import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/view_model/todo_form_controller.dart';
import 'package:flutter_todo_app/widget/datetime_input.dart';
import 'package:flutter_todo_app/widget/location_input_tab.dart';
import 'package:flutter_todo_app/widget/text_input.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'form_submit_button.dart';

final todoFormProvider =
    StateNotifierProvider.autoDispose((ref) => TodoFormStateController());

class TodoInputForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _inputArea(),
          _selectArea(),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget _selectArea() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_inputKinds(), FormSubmitButton()],
      ),
    );
  }

  Widget _inputArea() {
    final state = useProvider(todoFormProvider);
    switch (state.selectedKind) {
      case Kind.text:
        print('select test');
        return TextInput();
      case Kind.location:
        print('select latlon');
        return LocationInputTab();
      case Kind.datetime:
        print('select datetime');
        return DatetimeInput();
      default:
        print('select kind is not exist');
        exit(0);
    }
  }

  Widget _inputKinds() {
    final controller = useProvider(todoFormProvider.notifier);
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.add_comment),
          onPressed: () {
            controller.selectKind(Kind.text);
          },
        ),
        IconButton(
          icon: const Icon(Icons.access_time_filled),
          onPressed: () {
            controller.selectKind(Kind.datetime);
          },
        ),
        IconButton(
          icon: const Icon(Icons.add_location_sharp),
          onPressed: () {
            controller.selectKind(Kind.location);
          },
        ),
      ],
    );
  }
}
