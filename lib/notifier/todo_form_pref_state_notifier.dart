import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/state/todo_form_pref_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoFromPrefStateNotifier extends StateNotifier<TodoFromPrefState> {
  TodoFromPrefStateNotifier(this.read) : super(TodoFromPrefState());

  final Reader read;

  void setFormKind(SaveType formKind) {
    state = state.copyWith(saveType: formKind);
  }

  void selectTabKind(InputKind kind) {
    state = state.copyWith(inputKind: kind);
  }

  void onFocusChangeTextfield(bool hasFocus) {
    state = state.copyWith(isUpKeyboard: hasFocus);
  }
}
