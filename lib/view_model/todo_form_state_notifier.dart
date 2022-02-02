import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'state/todo_form_state.dart';

class TodoFormStateNotifier extends StateNotifier<TodoFormState> {
  //TODO:初期化はこれでいいのか調べる
  TodoFormStateNotifier(this.read) : super(TodoFormState());

  final Reader read;

  void setFormKind(SaveType formKind) {
    state = state.copyWith(saveType: formKind);
  }

  void inputId(String id) {
    state = state.copyWith(id: id);
  }

  void inputNotifyInAdvanceVal(int? value) {
    state = state.copyWith(notifyInAdvanceVal: value);
  }

  void inputText(String text) {
    print("change ${state}");
    state = state.copyWith(title: text);
  }

  void inputLocation(double latitude, double longitude,
      [String? locationName]) {
    state = state.copyWith(latitude: latitude, longitude: longitude);
    if (locationName != null) {
      state = state.copyWith(locationName: locationName);
    } else {
      _getAddress(latitude, longitude);
    }
  }

  Future _getAddress(double latitude, double longitude) async {
    final locationSearchRepository = read(locationSearchRepositoryProvider);
    //住所を取得
    final address =
        await locationSearchRepository.getAddress(LatLng(latitude, longitude));
    state = state.copyWith(locationName: address);
  }

  void inputDatetime(DateTime dateTime) {
    state = state.copyWith(eventTime: dateTime);
  }

  void selectTabKind(InputKind kind) {
    state = state.copyWith(inputKind: kind);
  }

  void onFocusChangeTextfield(bool hasFocus) {
    state = state.copyWith(isUpKeyboard: hasFocus);
  }
}
