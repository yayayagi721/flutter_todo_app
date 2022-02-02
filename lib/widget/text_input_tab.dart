import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/const/common.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TextInputTab extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController? _textEditingController;

    final formNotifier = ref.read(todoFormProvider.notifier);
    final formState = ref.watch(todoFormProvider);
    final focusNode = useFocusNode();

    useEffect(() {
      _textEditingController = TextEditingController(text: formState.title);
      focusNode.addListener(() {
        formNotifier.onFocusChangeTextfield(focusNode.hasFocus);
      });
    }, [focusNode]);
    double bottomSpace = 0;

    //キーボードが出ている時、キーボードの高さを取る
    if (MediaQuery.of(context).viewInsets.bottom != 0) {
      bottomSpace =
          MediaQuery.of(context).viewInsets.bottom - lyoutConst.menuBarHeight;
    }

    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Padding(
        padding:
            EdgeInsets.only(top: 10, left: 20, right: 20, bottom: bottomSpace),
        child: TextField(
          controller: _textEditingController,
          focusNode: focusNode,
          enabled: true,
          obscureText: false,
          maxLength: 20,
          maxLines: 1,
          onChanged: (input) {
            formNotifier.inputText(input);
          },
          decoration: InputDecoration(
            hintText: '予定内容を入力してください',
            filled: true,
          ),
          onSubmitted: (_) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
        ),
      ),
    );
  }
}
