// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location_search_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocationSearchFormStateTearOff {
  const _$LocationSearchFormStateTearOff();

  _LocationSearchFormState call({String text = ""}) {
    return _LocationSearchFormState(
      text: text,
    );
  }
}

/// @nodoc
const $LocationSearchFormState = _$LocationSearchFormStateTearOff();

/// @nodoc
mixin _$LocationSearchFormState {
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationSearchFormStateCopyWith<LocationSearchFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationSearchFormStateCopyWith<$Res> {
  factory $LocationSearchFormStateCopyWith(LocationSearchFormState value,
          $Res Function(LocationSearchFormState) then) =
      _$LocationSearchFormStateCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class _$LocationSearchFormStateCopyWithImpl<$Res>
    implements $LocationSearchFormStateCopyWith<$Res> {
  _$LocationSearchFormStateCopyWithImpl(this._value, this._then);

  final LocationSearchFormState _value;
  // ignore: unused_field
  final $Res Function(LocationSearchFormState) _then;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LocationSearchFormStateCopyWith<$Res>
    implements $LocationSearchFormStateCopyWith<$Res> {
  factory _$LocationSearchFormStateCopyWith(_LocationSearchFormState value,
          $Res Function(_LocationSearchFormState) then) =
      __$LocationSearchFormStateCopyWithImpl<$Res>;
  @override
  $Res call({String text});
}

/// @nodoc
class __$LocationSearchFormStateCopyWithImpl<$Res>
    extends _$LocationSearchFormStateCopyWithImpl<$Res>
    implements _$LocationSearchFormStateCopyWith<$Res> {
  __$LocationSearchFormStateCopyWithImpl(_LocationSearchFormState _value,
      $Res Function(_LocationSearchFormState) _then)
      : super(_value, (v) => _then(v as _LocationSearchFormState));

  @override
  _LocationSearchFormState get _value =>
      super._value as _LocationSearchFormState;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_LocationSearchFormState(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LocationSearchFormState implements _LocationSearchFormState {
  const _$_LocationSearchFormState({this.text = ""});

  @JsonKey()
  @override
  final String text;

  @override
  String toString() {
    return 'LocationSearchFormState(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationSearchFormState &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$LocationSearchFormStateCopyWith<_LocationSearchFormState> get copyWith =>
      __$LocationSearchFormStateCopyWithImpl<_LocationSearchFormState>(
          this, _$identity);
}

abstract class _LocationSearchFormState implements LocationSearchFormState {
  const factory _LocationSearchFormState({String text}) =
      _$_LocationSearchFormState;

  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$LocationSearchFormStateCopyWith<_LocationSearchFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
