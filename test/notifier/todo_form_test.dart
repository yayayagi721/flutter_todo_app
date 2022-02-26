import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/const/enums.dart';
import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/notifier/todo_form_pref_state_notifier.dart';
import 'package:flutter_todo_app/notifier/todo_form_state_notifier.dart';
import 'package:flutter_todo_app/repository/location_search_repository.dart';
import 'package:flutter_todo_app/state/todo_form_pref_state.dart';
import 'package:flutter_todo_app/state/todo_form_state.dart';
import 'package:flutter_todo_app/widget/todo_form.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'todo_form_test.mocks.dart';

final todoFromPrefStateProvider =
    StateNotifierProvider<TodoFromPrefStateNotifier, TodoFromPrefState>(
        (ref) => TodoFromPrefStateNotifier(ref.read));

final todoFromStateProvider =
    StateNotifierProvider<TodoFormStateNotifier, TodoFormState>(
        (ref) => TodoFormStateNotifier(ref.read));

ProviderContainer override({LocationSearchRepository? mockLocationSearchRepo}) {
  List<Override> overrides = [];
  if (mockLocationSearchRepo != null) {
    overrides.add(locationSearchRepositoryProvider.overrideWithProvider(
      Provider((ref) => mockLocationSearchRepo),
    ));
  }

  return ProviderContainer(
    overrides: overrides,
  );
}

@GenerateMocks([LocationSearchRepository])
void main() {
  group("TodoFromPrefStateNotifier", () {
    group("setFormKind", () {
      test("正常系", () {
        final container = ProviderContainer();
        final settingStateNotifier =
            container.read(todoFromPrefStateProvider.notifier);
        settingStateNotifier.setFormKind(SaveType.create);
        final settingState = container.read(todoFromPrefStateProvider);

        expect(settingState.saveType, SaveType.create);
      });
    });
    group("selectTabKind", () {
      test("正常系", () {
        final container = ProviderContainer();
        final settingStateNotifier =
            container.read(todoFromPrefStateProvider.notifier);
        settingStateNotifier.selectTabKind(InputKind.datetime);
        final settingState = container.read(todoFromPrefStateProvider);

        expect(settingState.inputKind, InputKind.datetime);
      });
    });
    group("onFocusChangeTextfield", () {
      test("正常系", () {
        final container = ProviderContainer();
        final settingStateNotifier =
            container.read(todoFromPrefStateProvider.notifier);
        settingStateNotifier.onFocusChangeTextfield(true);
        final settingState = container.read(todoFromPrefStateProvider);

        expect(settingState.isUpKeyboard, true);
      });
    });
  });
  group("TodoFormStateNotifier", () {
    group("inputId", () {
      test("正常系", () {
        final container = ProviderContainer();
        final settingStateNotifier =
            container.read(todoFromStateProvider.notifier);
        settingStateNotifier.inputId("test_id");
        final settingState = container.read(todoFromStateProvider);

        expect(settingState.id, "test_id");
      });
    });
    group("inputNotifyInAdvanceVal", () {
      test("正常系", () {
        final container = ProviderContainer();
        final settingStateNotifier =
            container.read(todoFromStateProvider.notifier);
        settingStateNotifier.inputNotifyInAdvanceVal(10);
        final settingState = container.read(todoFromStateProvider);

        expect(settingState.notifyInAdvanceVal, 10);
      });
    });
    group("inputTitle", () {
      test("正常系", () {
        final container = ProviderContainer();
        final settingStateNotifier =
            container.read(todoFromStateProvider.notifier);
        settingStateNotifier.inputTitle("test_text");
        final settingState = container.read(todoFromStateProvider);

        expect(settingState.title, "test_text");
      });
    });
    group("inputLocation", () {
      test("addressがnot null", () {
        final _mockLocationSearchRepository = MockLocationSearchRepository();
        when(_mockLocationSearchRepository.getAddress(any))
            .thenAnswer((realInvocation) async {
          return Future.delayed(Duration(milliseconds: 500), () {
            return "address";
          });
        });
        final container =
            override(mockLocationSearchRepo: _mockLocationSearchRepository);
        final todoFormStateNotifier =
            container.read(todoFormStateProvider.notifier);
        todoFormStateNotifier.inputLocation(LatLng(10, 20), "test_address");

        var todoFormState = container.read(todoFormStateProvider);

        expect(todoFormState.locationInfo!.latitude, 10);
        expect(todoFormState.locationInfo!.longitude, 20);
        expect(todoFormState.locationInfo!.address, "test_address");
        verifyNever(_mockLocationSearchRepository.getAddress(any));
      });
      test("addressがnull", () async {
        final _mockLocationSearchRepository = MockLocationSearchRepository();
        when(_mockLocationSearchRepository.getAddress(any))
            .thenAnswer((realInvocation) async {
          return Future.delayed(Duration(milliseconds: 500), () {
            return "address";
          });
        });
        final container =
            override(mockLocationSearchRepo: _mockLocationSearchRepository);
        final todoFormStateNotifier =
            container.read(todoFormStateProvider.notifier);
        todoFormStateNotifier.inputLocation(LatLng(10, 20));

        //autoDisposeされてしまう為、listen
        var todoFormState =
            container.listen(todoFormStateProvider, (_, __) {}).read();

        expect(todoFormState.locationInfo!.latitude, 10);
        expect(todoFormState.locationInfo!.longitude, 20);
        expect(todoFormState.locationInfo!.address, null);

        await Future.delayed(const Duration(milliseconds: 1000), () {});

        todoFormState =
            container.listen(todoFormStateProvider, (_, __) {}).read();

        expect(todoFormState.locationInfo!.latitude, 10);
        expect(todoFormState.locationInfo!.longitude, 20);
        expect(todoFormState.locationInfo!.address, "address");
        verify(_mockLocationSearchRepository.getAddress(any)).called(1);
      });
    });
    group("inputDatetime", () {
      test("正常系", () {
        final container = ProviderContainer();
        final settingStateNotifier =
            container.read(todoFromStateProvider.notifier);
        final inoutDt = DateTime.now();
        settingStateNotifier.inputDatetime(inoutDt);
        final settingState = container.read(todoFromStateProvider);

        expect(settingState.eventTime, inoutDt);
      });
    });
  });
}
