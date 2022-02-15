import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/model/location_info.dart';
import 'package:flutter_todo_app/state/setting_state.dart';
import 'package:flutter_todo_app/view/setting_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingStateNotifier extends StateNotifier<SettingState> {
  SettingStateNotifier(this.read)
      : super(SettingState(read(settingRepositoryProvider).getRemaindInterval(),
            read(settingRepositoryProvider).getDefaultLocationInfo()));

  final Reader read;

  Future changeDefaultLatLng(LatLng newLatLng) async {
    final settingRepository = read(settingRepositoryProvider);
    final locationSearchRepository = read(locationSearchRepositoryProvider);

    final address = await locationSearchRepository.getAddress(newLatLng);

    final newInfo =
        LocationInfo(newLatLng.latitude, newLatLng.longitude, address);
    settingRepository.setDefaultLocationInfo(newInfo);
    state = state.copyWith(defaultLocation: newInfo);
  }

  void changeRemaindInterval(int newInterval) {
    final settingRepository = read(settingRepositoryProvider);
    state = state.copyWith(remaindInterval: newInterval);
    settingRepository.setRemaindInterval(newInterval);
  }
}
