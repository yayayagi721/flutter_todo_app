import 'package:flutter_todo_app/repository/location_search_repository_impl.dart';
import 'package:flutter_todo_app/view_model/state/textbox_state.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationSearchFormViewModel extends StateNotifier<TextBoxState> {
  LocationSearchFormViewModel(this._locationSearchRepository)
      : super(TextBoxState());

  final LocationSearchRepositoryImpl _locationSearchRepository;

  void update(String text) {
    state = state.copyWith(text: text);
  }

  Future<Location?> searchLocation() async {
    final address = state.text;
    var location;
    try {
      final locations = await _locationSearchRepository.getLocations(address);
      location = locations[0];
    } catch (e) {
      location = null;
    }

    return location;
  }
}
