// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SettingStateTearOff {
  const _$SettingStateTearOff();

  _SettingState call(int remaindInterval, LocationInfo? defaultLocation) {
    return _SettingState(
      remaindInterval,
      defaultLocation,
    );
  }
}

/// @nodoc
const $SettingState = _$SettingStateTearOff();

/// @nodoc
mixin _$SettingState {
  int get remaindInterval => throw _privateConstructorUsedError;
  LocationInfo? get defaultLocation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingStateCopyWith<SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingStateCopyWith<$Res> {
  factory $SettingStateCopyWith(
          SettingState value, $Res Function(SettingState) then) =
      _$SettingStateCopyWithImpl<$Res>;
  $Res call({int remaindInterval, LocationInfo? defaultLocation});

  $LocationInfoCopyWith<$Res>? get defaultLocation;
}

/// @nodoc
class _$SettingStateCopyWithImpl<$Res> implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._value, this._then);

  final SettingState _value;
  // ignore: unused_field
  final $Res Function(SettingState) _then;

  @override
  $Res call({
    Object? remaindInterval = freezed,
    Object? defaultLocation = freezed,
  }) {
    return _then(_value.copyWith(
      remaindInterval: remaindInterval == freezed
          ? _value.remaindInterval
          : remaindInterval // ignore: cast_nullable_to_non_nullable
              as int,
      defaultLocation: defaultLocation == freezed
          ? _value.defaultLocation
          : defaultLocation // ignore: cast_nullable_to_non_nullable
              as LocationInfo?,
    ));
  }

  @override
  $LocationInfoCopyWith<$Res>? get defaultLocation {
    if (_value.defaultLocation == null) {
      return null;
    }

    return $LocationInfoCopyWith<$Res>(_value.defaultLocation!, (value) {
      return _then(_value.copyWith(defaultLocation: value));
    });
  }
}

/// @nodoc
abstract class _$SettingStateCopyWith<$Res>
    implements $SettingStateCopyWith<$Res> {
  factory _$SettingStateCopyWith(
          _SettingState value, $Res Function(_SettingState) then) =
      __$SettingStateCopyWithImpl<$Res>;
  @override
  $Res call({int remaindInterval, LocationInfo? defaultLocation});

  @override
  $LocationInfoCopyWith<$Res>? get defaultLocation;
}

/// @nodoc
class __$SettingStateCopyWithImpl<$Res> extends _$SettingStateCopyWithImpl<$Res>
    implements _$SettingStateCopyWith<$Res> {
  __$SettingStateCopyWithImpl(
      _SettingState _value, $Res Function(_SettingState) _then)
      : super(_value, (v) => _then(v as _SettingState));

  @override
  _SettingState get _value => super._value as _SettingState;

  @override
  $Res call({
    Object? remaindInterval = freezed,
    Object? defaultLocation = freezed,
  }) {
    return _then(_SettingState(
      remaindInterval == freezed
          ? _value.remaindInterval
          : remaindInterval // ignore: cast_nullable_to_non_nullable
              as int,
      defaultLocation == freezed
          ? _value.defaultLocation
          : defaultLocation // ignore: cast_nullable_to_non_nullable
              as LocationInfo?,
    ));
  }
}

/// @nodoc

class _$_SettingState implements _SettingState {
  const _$_SettingState(this.remaindInterval, this.defaultLocation);

  @override
  final int remaindInterval;
  @override
  final LocationInfo? defaultLocation;

  @override
  String toString() {
    return 'SettingState(remaindInterval: $remaindInterval, defaultLocation: $defaultLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingState &&
            const DeepCollectionEquality()
                .equals(other.remaindInterval, remaindInterval) &&
            const DeepCollectionEquality()
                .equals(other.defaultLocation, defaultLocation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(remaindInterval),
      const DeepCollectionEquality().hash(defaultLocation));

  @JsonKey(ignore: true)
  @override
  _$SettingStateCopyWith<_SettingState> get copyWith =>
      __$SettingStateCopyWithImpl<_SettingState>(this, _$identity);
}

abstract class _SettingState implements SettingState {
  const factory _SettingState(
      int remaindInterval, LocationInfo? defaultLocation) = _$_SettingState;

  @override
  int get remaindInterval;
  @override
  LocationInfo? get defaultLocation;
  @override
  @JsonKey(ignore: true)
  _$SettingStateCopyWith<_SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}
