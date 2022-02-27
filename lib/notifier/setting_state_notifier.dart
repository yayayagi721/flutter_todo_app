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
    final locationSearchRepository = read(locationSearchRepositoryProvider);

    final newInfo = LocationInfo(newLatLng.latitude, newLatLng.longitude, null);

    _setDefaultLatLng(newInfo);

    final address = await locationSearchRepository.getAddress(newLatLng);
    //address取得後、再度setする
    final addressWithInfo =
        LocationInfo(newLatLng.latitude, newLatLng.longitude, address);
    _setDefaultLatLng(addressWithInfo);
  }

  void changeRemaindInterval(int newInterval) {
    final settingRepository = read(settingRepositoryProvider);
    state = state.copyWith(remaindInterval: newInterval);
    settingRepository.setRemaindInterval(newInterval);
  }

  void _setDefaultLatLng(LocationInfo locationInfo) {
    final settingRepository = read(settingRepositoryProvider);
    settingRepository.setDefaultLocationInfo(locationInfo);
    state = state.copyWith(defaultLocation: locationInfo);
  }
}
