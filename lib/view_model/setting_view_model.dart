import 'package:flutter_todo_app/model/location_info.dart';
import 'package:flutter_todo_app/repository/location_search_repository_impl.dart';
import 'package:flutter_todo_app/repository/setting_repository_impl.dart';
import 'package:flutter_todo_app/repository/todo_list_repository_impl.dart';
import 'package:flutter_todo_app/utils/str_utils.dart';
import 'package:flutter_todo_app/view_model/state/setting_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingViewModel extends StateNotifier<SettingState> {
  SettingViewModel(this.settingRepositoryImpl, this.locationSearchRepository)
      : super(SettingState(settingRepositoryImpl.getRemaindInterval(),
            settingRepositoryImpl.getDefaultLocationInfo()));

  final SettingRepositoryImpl settingRepositoryImpl;
  final LocationSearchRepositoryImpl locationSearchRepository;

  void changeDefaultLatLng(LatLng newLatLng) {
    final newInfo = LocationInfo(newLatLng.latitude, newLatLng.longitude);
    state = state.copyWith(defaultLocation: newInfo);

    getAddress();
    settingRepositoryImpl.setDefaultLocationInfo(newInfo);
  }

  void changeRemaindInterval(int newInterval) {
    state = state.copyWith(remaindInterval: newInterval);
    settingRepositoryImpl.setRemaindInterval(newInterval);
  }

  Future getAddress() async {
    final address = await locationSearchRepository.getAddress(LatLng(
        state.defaultLocation.latitude, state.defaultLocation.longitude));
    final newInfo = LocationInfo(state.defaultLocation.latitude,
        state.defaultLocation.longitude, address);
    settingRepositoryImpl.setDefaultLocationInfo(newInfo);
    state = state.copyWith(defaultLocation: newInfo);
  }
}
