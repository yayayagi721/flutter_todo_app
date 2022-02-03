import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/model/location_info.dart';
import 'package:flutter_todo_app/view/setting_view.dart';
import 'package:flutter_todo_app/view_model/state/setting_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingStateNotifier extends StateNotifier<SettingState> {
  SettingStateNotifier(this.read)
      : super(SettingState(read(settingRepositoryProvider).getRemaindInterval(),
            read(settingRepositoryProvider).getDefaultLocationInfo()));

  final Reader read;

  void changeDefaultLatLng(LatLng newLatLng) {
    final settingRepository = read(settingRepositoryProvider);

    final newInfo = LocationInfo(newLatLng.latitude, newLatLng.longitude);
    state = state.copyWith(defaultLocation: newInfo);

    getAddress();
    settingRepository.setDefaultLocationInfo(newInfo);
  }

  void changeRemaindInterval(int newInterval) {
    final settingRepository = read(settingRepositoryProvider);
    state = state.copyWith(remaindInterval: newInterval);
    settingRepository.setRemaindInterval(newInterval);
  }

  Future getAddress() async {
    final locationSearchRepository = read(locationSearchRepositoryProvider);
    final settingRepository = read(settingRepositoryProvider);

    final address = await locationSearchRepository.getAddress(LatLng(
        state.defaultLocation.latitude, state.defaultLocation.longitude));
    final newInfo = LocationInfo(state.defaultLocation.latitude,
        state.defaultLocation.longitude, address);
    settingRepository.setDefaultLocationInfo(newInfo);
    state = state.copyWith(defaultLocation: newInfo);
  }
}
