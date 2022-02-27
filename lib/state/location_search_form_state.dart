import 'package:freezed_annotation/freezed_annotation.dart';
part 'location_search_form_state.freezed.dart';

@freezed
class LocationSearchFormState with _$LocationSearchFormState {
  const factory LocationSearchFormState({@Default("") String text}) =
      _LocationSearchFormState;
}
