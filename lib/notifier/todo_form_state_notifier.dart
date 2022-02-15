import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/model/location_info.dart';
import 'package:flutter_todo_app/state/todo_form_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoFormStateNotifier extends StateNotifier<TodoFormState> {
  //TODO:初期化はこれでいいのか調べる
  TodoFormStateNotifier(this.read) : super(TodoFormState());

  final Reader read;

  void inputId(String id) {
    state = state.copyWith(id: id);
  }

  void inputNotifyInAdvanceVal(int? value) {
    state = state.copyWith(notifyInAdvanceVal: value);
  }

  void inputText(String text) {
    state = state.copyWith(title: text);
  }

  void inputLocation(double latitude, double longitude,
      [String? locationName]) {
    final locationSearchRepository = read(locationSearchRepositoryProvider);
    final locationInfo = LocationInfo(latitude, longitude, locationName);
    state = state.copyWith(locationInfo: locationInfo);
    if (locationName == null) {
      locationSearchRepository
          .getAddress(LatLng(latitude, longitude))
          .then((address) {
        final locationInfo = LocationInfo(latitude, longitude, address);
        state = state.copyWith(locationInfo: locationInfo);
      });
    }
  }

  void inputDatetime(DateTime dateTime) {
    state = state.copyWith(eventTime: dateTime);
  }
}
