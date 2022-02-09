import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/view_model/state/textbox_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationSearchFormViewModel extends StateNotifier<TextBoxState> {
  LocationSearchFormViewModel(this.read) : super(TextBoxState());

  final Reader read;

  void update(String text) {
    state = state.copyWith(text: text);
  }

  Future<LatLng?> searchLocation() async {
    final locationSearchRepository = read(locationSearchRepositoryProvider);
    final address = state.text;
    var latLng;
    try {
      final locations = await locationSearchRepository.getLocations(address);
      latLng = LatLng(locations[0].latitude, locations[0].longitude);
    } catch (e) {
      latLng = null;
    }

    return latLng;
  }
}
