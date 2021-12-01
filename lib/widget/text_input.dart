import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TextInput extends HookWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController? _textEditingController;

    final controller = useProvider(todoFormProvider.notifier);
    final state = useProvider(todoFormProvider);

    useEffect(() {
      _textEditingController = TextEditingController(text: state.title);
    }, []);

    return Container(
      child: TextField(
        controller: _textEditingController,
        enabled: true,
        maxLength: 10,
        style: TextStyle(color: Colors.red),
        obscureText: false,
        maxLines: 1,
        onChanged: (input) {
          controller.inputText(input);
        },
      ),
    );
  }
}
