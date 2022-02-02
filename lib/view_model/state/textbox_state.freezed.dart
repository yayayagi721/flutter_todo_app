// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'textbox_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TextBoxStateTearOff {
  const _$TextBoxStateTearOff();

  _TextBoxState call({String text = ""}) {
    return _TextBoxState(
      text: text,
    );
  }
}

/// @nodoc
const $TextBoxState = _$TextBoxStateTearOff();

/// @nodoc
mixin _$TextBoxState {
  String get text => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextBoxStateCopyWith<TextBoxState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextBoxStateCopyWith<$Res> {
  factory $TextBoxStateCopyWith(
          TextBoxState value, $Res Function(TextBoxState) then) =
      _$TextBoxStateCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class _$TextBoxStateCopyWithImpl<$Res> implements $TextBoxStateCopyWith<$Res> {
  _$TextBoxStateCopyWithImpl(this._value, this._then);

  final TextBoxState _value;
  // ignore: unused_field
  final $Res Function(TextBoxState) _then;

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
abstract class _$TextBoxStateCopyWith<$Res>
    implements $TextBoxStateCopyWith<$Res> {
  factory _$TextBoxStateCopyWith(
          _TextBoxState value, $Res Function(_TextBoxState) then) =
      __$TextBoxStateCopyWithImpl<$Res>;
  @override
  $Res call({String text});
}

/// @nodoc
class __$TextBoxStateCopyWithImpl<$Res> extends _$TextBoxStateCopyWithImpl<$Res>
    implements _$TextBoxStateCopyWith<$Res> {
  __$TextBoxStateCopyWithImpl(
      _TextBoxState _value, $Res Function(_TextBoxState) _then)
      : super(_value, (v) => _then(v as _TextBoxState));

  @override
  _TextBoxState get _value => super._value as _TextBoxState;

  @override
  $Res call({
    Object? text = freezed,
  }) {
    return _then(_TextBoxState(
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TextBoxState implements _TextBoxState {
  const _$_TextBoxState({this.text = ""});

  @JsonKey()
  @override
  final String text;

  @override
  String toString() {
    return 'TextBoxState(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TextBoxState &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  _$TextBoxStateCopyWith<_TextBoxState> get copyWith =>
      __$TextBoxStateCopyWithImpl<_TextBoxState>(this, _$identity);
}

abstract class _TextBoxState implements TextBoxState {
  const factory _TextBoxState({String text}) = _$_TextBoxState;

  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$TextBoxStateCopyWith<_TextBoxState> get copyWith =>
      throw _privateConstructorUsedError;
}
