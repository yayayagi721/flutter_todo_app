import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/const/common.dart';
import 'package:flutter_todo_app/view_model/todo_form_view_model.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TextInput extends HookWidget {
  final GlobalKey menuBarKey;
  TextInput(this.menuBarKey);

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
    double bottomSpace = 0;

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
            controller.inputText(input);
          },
          decoration: InputDecoration(
            hintText: '予定内容を入力してください',
            filled: true,
          ),
          onSubmitted: (_) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          // ),
        ),
      ),
    );
  }

  // void _onFocusChange(TodoFormStateController controller) {
  //   ;
  //   print("hoge:{$focusNode.hasFocus}");
  // }
}
