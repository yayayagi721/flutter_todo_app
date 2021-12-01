// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoFormStateTearOff {
  const _$TodoFormStateTearOff();

  _TodoFormState call(
      {Kind selectedKind = Kind.text,
      String title = "",
      double? latitude = null,
      double? longitude = null,
      DateTime? eventTime = null}) {
    return _TodoFormState(
      selectedKind: selectedKind,
      title: title,
      latitude: latitude,
      longitude: longitude,
      eventTime: eventTime,
    );
  }
}

/// @nodoc
const $TodoFormState = _$TodoFormStateTearOff();

/// @nodoc
mixin _$TodoFormState {
  Kind get selectedKind => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  DateTime? get eventTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoFormStateCopyWith<TodoFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoFormStateCopyWith<$Res> {
  factory $TodoFormStateCopyWith(
          TodoFormState value, $Res Function(TodoFormState) then) =
      _$TodoFormStateCopyWithImpl<$Res>;
  $Res call(
      {Kind selectedKind,
      String title,
      double? latitude,
      double? longitude,
      DateTime? eventTime});
}

/// @nodoc
class _$TodoFormStateCopyWithImpl<$Res>
    implements $TodoFormStateCopyWith<$Res> {
  _$TodoFormStateCopyWithImpl(this._value, this._then);

  final TodoFormState _value;
  // ignore: unused_field
  final $Res Function(TodoFormState) _then;

  @override
  $Res call({
    Object? selectedKind = freezed,
    Object? title = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? eventTime = freezed,
  }) {
    return _then(_value.copyWith(
      selectedKind: selectedKind == freezed
          ? _value.selectedKind
          : selectedKind // ignore: cast_nullable_to_non_nullable
              as Kind,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      eventTime: eventTime == freezed
          ? _value.eventTime
          : eventTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$TodoFormStateCopyWith<$Res>
    implements $TodoFormStateCopyWith<$Res> {
  factory _$TodoFormStateCopyWith(
          _TodoFormState value, $Res Function(_TodoFormState) then) =
      __$TodoFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Kind selectedKind,
      String title,
      double? latitude,
      double? longitude,
      DateTime? eventTime});
}

/// @nodoc
class __$TodoFormStateCopyWithImpl<$Res>
    extends _$TodoFormStateCopyWithImpl<$Res>
    implements _$TodoFormStateCopyWith<$Res> {
  __$TodoFormStateCopyWithImpl(
      _TodoFormState _value, $Res Function(_TodoFormState) _then)
      : super(_value, (v) => _then(v as _TodoFormState));

  @override
  _TodoFormState get _value => super._value as _TodoFormState;

  @override
  $Res call({
    Object? selectedKind = freezed,
    Object? title = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? eventTime = freezed,
  }) {
    return _then(_TodoFormState(
      selectedKind: selectedKind == freezed
          ? _value.selectedKind
          : selectedKind // ignore: cast_nullable_to_non_nullable
              as Kind,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      eventTime: eventTime == freezed
          ? _value.eventTime
          : eventTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_TodoFormState extends _TodoFormState with DiagnosticableTreeMixin {
  const _$_TodoFormState(
      {this.selectedKind = Kind.text,
      this.title = "",
      this.latitude = null,
      this.longitude = null,
      this.eventTime = null})
      : super._();

  @JsonKey(defaultValue: Kind.text)
  @override
  final Kind selectedKind;
  @JsonKey(defaultValue: "")
  @override
  final String title;
  @JsonKey(defaultValue: null)
  @override
  final double? latitude;
  @JsonKey(defaultValue: null)
  @override
  final double? longitude;
  @JsonKey(defaultValue: null)
  @override
  final DateTime? eventTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodoFormState(selectedKind: $selectedKind, title: $title, latitude: $latitude, longitude: $longitude, eventTime: $eventTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TodoFormState'))
      ..add(DiagnosticsProperty('selectedKind', selectedKind))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('eventTime', eventTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodoFormState &&
            (identical(other.selectedKind, selectedKind) ||
                const DeepCollectionEquality()
                    .equals(other.selectedKind, selectedKind)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.eventTime, eventTime) ||
                const DeepCollectionEquality()
                    .equals(other.eventTime, eventTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedKind) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(eventTime);

  @JsonKey(ignore: true)
  @override
  _$TodoFormStateCopyWith<_TodoFormState> get copyWith =>
      __$TodoFormStateCopyWithImpl<_TodoFormState>(this, _$identity);
}

abstract class _TodoFormState extends TodoFormState {
  const factory _TodoFormState(
      {Kind selectedKind,
      String title,
      double? latitude,
      double? longitude,
      DateTime? eventTime}) = _$_TodoFormState;
  const _TodoFormState._() : super._();

  @override
  Kind get selectedKind => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  double? get latitude => throw _privateConstructorUsedError;
  @override
  double? get longitude => throw _privateConstructorUsedError;
  @override
  DateTime? get eventTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TodoFormStateCopyWith<_TodoFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
