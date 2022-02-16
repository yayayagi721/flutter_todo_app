import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/notifier/location_search_form_state_notifier.dart';
import 'package:flutter_todo_app/repository/location_search_repository.dart';
import 'package:flutter_todo_app/state/location_search_form_state.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'location_search_form_test.mocks.dart';

final locationSearchFormStateProvider =
    StateNotifierProvider<LocationSearchFormNotifier, LocationSearchFormState>(
  (ref) => LocationSearchFormNotifier(ref.read),
);

ProviderContainer override(LocationSearchRepository mockLocationSearchRepo) {
  return ProviderContainer(
    overrides: [
      locationSearchRepositoryProvider.overrideWithProvider(
        Provider((ref) => mockLocationSearchRepo),
      ),
    ],
  );
}

@GenerateMocks([LocationSearchRepository])
void main() {
  group('LocationSearchForm', () {
    group('update', () {
      test('正常値', () {
        final container = ProviderContainer();
        LocationSearchFormNotifier locationSearchFormNotifier =
            container.read(locationSearchFormStateProvider.notifier);
        locationSearchFormNotifier.update("test");

        final locationSearchFormState =
            container.read(locationSearchFormStateProvider);

        expect(locationSearchFormState.text, "test");

        locationSearchFormNotifier.update("changed");

        final locationSearchFormStateChanged =
            container.read(locationSearchFormStateProvider);

        expect(locationSearchFormStateChanged.text, "changed");
      });
    });
    group('searchLocation', () {
      late MockLocationSearchRepository mockLocationSearchRepo;

      setUp(() {
        mockLocationSearchRepo = MockLocationSearchRepository();
      });

      test('一件該当', () async {
        when(mockLocationSearchRepo.getLocations("correct_adress")).thenAnswer(
            (_) async => Future.value([
                  Location(
                      latitude: 1,
                      longitude: 1,
                      timestamp: DateTime.parse("2022-02-01"))
                ]));
        final container = override(mockLocationSearchRepo);

        LocationSearchFormNotifier locationSearchFormNotifier =
            container.read(locationSearchFormStateProvider.notifier);

        locationSearchFormNotifier.update("correct_adress");

        final searchedLocation =
            await locationSearchFormNotifier.searchLocation();

        expect(searchedLocation!.latitude, 1);
        expect(searchedLocation.longitude, 1);
      });
      test('二件該当', () async {
        when(mockLocationSearchRepo.getLocations("correct_adress"))
            .thenAnswer((_) async => Future.value([
                  Location(
                      latitude: 2,
                      longitude: 2,
                      timestamp: DateTime.parse("2022-02-02")),
                  Location(
                      latitude: 3,
                      longitude: 3,
                      timestamp: DateTime.parse("2022-02-03"))
                ]));
        final container = override(mockLocationSearchRepo);

        LocationSearchFormNotifier locationSearchFormNotifier =
            container.read(locationSearchFormStateProvider.notifier);

        locationSearchFormNotifier.update("correct_adress");

        final searchedLocation =
            await locationSearchFormNotifier.searchLocation();

        expect(searchedLocation!.latitude, 2);
        expect(searchedLocation.longitude, 2);
      });
      test('該当なし', () async {
        when(mockLocationSearchRepo.getLocations("correct_adress"))
            .thenAnswer((_) async => Future.value([]));
        final container = override(mockLocationSearchRepo);

        LocationSearchFormNotifier locationSearchFormNotifier =
            container.read(locationSearchFormStateProvider.notifier);

        locationSearchFormNotifier.update("correct_adress");

        final searchedLocation =
            await locationSearchFormNotifier.searchLocation();

        expect(searchedLocation, null);
      });
    });
  });
}
