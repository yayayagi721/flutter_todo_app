import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/view_model/state/textbox_state.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationSearchFormViewModel extends StateNotifier<TextBoxState> {
  LocationSearchFormViewModel(this.read) : super(TextBoxState());

  final Reader read;

  void update(String text) {
    state = state.copyWith(text: text);
  }

  Future<Location?> searchLocation() async {
    final locationSearchRepository = read(locationSearchRepositoryProvider);
    final address = state.text;
    var location;
    try {
      final locations = await locationSearchRepository.getLocations(address);
      location = locations[0];
    } catch (e) {
      location = null;
    }

    return location;
  }
}
