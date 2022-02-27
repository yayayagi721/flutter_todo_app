// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_form_pref_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoFromPrefStateTearOff {
  const _$TodoFromPrefStateTearOff();

  _TodoFromPrefState call(
      {SaveType saveType = SaveType.create,
      InputKind inputKind = InputKind.text,
      bool isUpKeyboard = false}) {
    return _TodoFromPrefState(
      saveType: saveType,
      inputKind: inputKind,
      isUpKeyboard: isUpKeyboard,
    );
  }
}

/// @nodoc
const $TodoFromPrefState = _$TodoFromPrefStateTearOff();

/// @nodoc
mixin _$TodoFromPrefState {
  SaveType get saveType => throw _privateConstructorUsedError;
  InputKind get inputKind => throw _privateConstructorUsedError;
  bool get isUpKeyboard => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoFromPrefStateCopyWith<TodoFromPrefState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoFromPrefStateCopyWith<$Res> {
  factory $TodoFromPrefStateCopyWith(
          TodoFromPrefState value, $Res Function(TodoFromPrefState) then) =
      _$TodoFromPrefStateCopyWithImpl<$Res>;
  $Res call({SaveType saveType, InputKind inputKind, bool isUpKeyboard});
}

/// @nodoc
class _$TodoFromPrefStateCopyWithImpl<$Res>
    implements $TodoFromPrefStateCopyWith<$Res> {
  _$TodoFromPrefStateCopyWithImpl(this._value, this._then);

  final TodoFromPrefState _value;
  // ignore: unused_field
  final $Res Function(TodoFromPrefState) _then;

  @override
  $Res call({
    Object? saveType = freezed,
    Object? inputKind = freezed,
    Object? isUpKeyboard = freezed,
  }) {
    return _then(_value.copyWith(
      saveType: saveType == freezed
          ? _value.saveType
          : saveType // ignore: cast_nullable_to_non_nullable
              as SaveType,
      inputKind: inputKind == freezed
          ? _value.inputKind
          : inputKind // ignore: cast_nullable_to_non_nullable
              as InputKind,
      isUpKeyboard: isUpKeyboard == freezed
          ? _value.isUpKeyboard
          : isUpKeyboard // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TodoFromPrefStateCopyWith<$Res>
    implements $TodoFromPrefStateCopyWith<$Res> {
  factory _$TodoFromPrefStateCopyWith(
          _TodoFromPrefState value, $Res Function(_TodoFromPrefState) then) =
      __$TodoFromPrefStateCopyWithImpl<$Res>;
  @override
  $Res call({SaveType saveType, InputKind inputKind, bool isUpKeyboard});
}

/// @nodoc
class __$TodoFromPrefStateCopyWithImpl<$Res>
    extends _$TodoFromPrefStateCopyWithImpl<$Res>
    implements _$TodoFromPrefStateCopyWith<$Res> {
  __$TodoFromPrefStateCopyWithImpl(
      _TodoFromPrefState _value, $Res Function(_TodoFromPrefState) _then)
      : super(_value, (v) => _then(v as _TodoFromPrefState));

  @override
  _TodoFromPrefState get _value => super._value as _TodoFromPrefState;

  @override
  $Res call({
    Object? saveType = freezed,
    Object? inputKind = freezed,
    Object? isUpKeyboard = freezed,
  }) {
    return _then(_TodoFromPrefState(
      saveType: saveType == freezed
          ? _value.saveType
          : saveType // ignore: cast_nullable_to_non_nullable
              as SaveType,
      inputKind: inputKind == freezed
          ? _value.inputKind
          : inputKind // ignore: cast_nullable_to_non_nullable
              as InputKind,
      isUpKeyboard: isUpKeyboard == freezed
          ? _value.isUpKeyboard
          : isUpKeyboard // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TodoFromPrefState implements _TodoFromPrefState {
  const _$_TodoFromPrefState(
      {this.saveType = SaveType.create,
      this.inputKind = InputKind.text,
      this.isUpKeyboard = false});

  @JsonKey()
  @override
  final SaveType saveType;
  @JsonKey()
  @override
  final InputKind inputKind;
  @JsonKey()
  @override
  final bool isUpKeyboard;

  @override
  String toString() {
    return 'TodoFromPrefState(saveType: $saveType, inputKind: $inputKind, isUpKeyboard: $isUpKeyboard)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoFromPrefState &&
            const DeepCollectionEquality().equals(other.saveType, saveType) &&
            const DeepCollectionEquality().equals(other.inputKind, inputKind) &&
            const DeepCollectionEquality()
                .equals(other.isUpKeyboard, isUpKeyboard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(saveType),
      const DeepCollectionEquality().hash(inputKind),
      const DeepCollectionEquality().hash(isUpKeyboard));

  @JsonKey(ignore: true)
  @override
  _$TodoFromPrefStateCopyWith<_TodoFromPrefState> get copyWith =>
      __$TodoFromPrefStateCopyWithImpl<_TodoFromPrefState>(this, _$identity);
}

abstract class _TodoFromPrefState implements TodoFromPrefState {
  const factory _TodoFromPrefState(
      {SaveType saveType,
      InputKind inputKind,
      bool isUpKeyboard}) = _$_TodoFromPrefState;

  @override
  SaveType get saveType;
  @override
  InputKind get inputKind;
  @override
  bool get isUpKeyboard;
  @override
  @JsonKey(ignore: true)
  _$TodoFromPrefStateCopyWith<_TodoFromPrefState> get copyWith =>
      throw _privateConstructorUsedError;
}
