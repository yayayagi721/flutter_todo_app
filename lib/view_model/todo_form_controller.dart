import 'package:flutter_todo_app/const/enums.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'state/todo_form_state.dart';

class TodoFormStateController extends StateNotifier<TodoFormState> {
  //TODO:初期化はこれでいいのか調べる
  TodoFormStateController() : super(TodoFormState());

  void inputText(String text) {
    print("change ${state}");
    state = state.copyWith(title: text);
  }

  void inputLocation(double latitude, double longitude) {
    state = state.copyWith(latitude: latitude, longitude: longitude);
  }

  void inputDatetime(DateTime dateTime) {
    state = state.copyWith(eventTime: dateTime);
  }

  void selectKind(Kind kind) {
    state = state.copyWith(selectedKind: kind);
  }
}
