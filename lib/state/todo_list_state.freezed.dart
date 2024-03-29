// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoListStateTearOff {
  const _$TodoListStateTearOff();

  _TodoListState call(
      {bool isLoaded = false,
      bool isOldLoadable = false,
      Map<String, List<Todo>> todoList = const {}}) {
    return _TodoListState(
      isLoaded: isLoaded,
      isOldLoadable: isOldLoadable,
      todoList: todoList,
    );
  }
}

/// @nodoc
const $TodoListState = _$TodoListStateTearOff();

/// @nodoc
mixin _$TodoListState {
  bool get isLoaded => throw _privateConstructorUsedError;
  bool get isOldLoadable => throw _privateConstructorUsedError;
  Map<String, List<Todo>> get todoList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoListStateCopyWith<TodoListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListStateCopyWith<$Res> {
  factory $TodoListStateCopyWith(
          TodoListState value, $Res Function(TodoListState) then) =
      _$TodoListStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoaded, bool isOldLoadable, Map<String, List<Todo>> todoList});
}

/// @nodoc
class _$TodoListStateCopyWithImpl<$Res>
    implements $TodoListStateCopyWith<$Res> {
  _$TodoListStateCopyWithImpl(this._value, this._then);

  final TodoListState _value;
  // ignore: unused_field
  final $Res Function(TodoListState) _then;

  @override
  $Res call({
    Object? isLoaded = freezed,
    Object? isOldLoadable = freezed,
    Object? todoList = freezed,
  }) {
    return _then(_value.copyWith(
      isLoaded: isLoaded == freezed
          ? _value.isLoaded
          : isLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isOldLoadable: isOldLoadable == freezed
          ? _value.isOldLoadable
          : isOldLoadable // ignore: cast_nullable_to_non_nullable
              as bool,
      todoList: todoList == freezed
          ? _value.todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Todo>>,
    ));
  }
}

/// @nodoc
abstract class _$TodoListStateCopyWith<$Res>
    implements $TodoListStateCopyWith<$Res> {
  factory _$TodoListStateCopyWith(
          _TodoListState value, $Res Function(_TodoListState) then) =
      __$TodoListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoaded, bool isOldLoadable, Map<String, List<Todo>> todoList});
}

/// @nodoc
class __$TodoListStateCopyWithImpl<$Res>
    extends _$TodoListStateCopyWithImpl<$Res>
    implements _$TodoListStateCopyWith<$Res> {
  __$TodoListStateCopyWithImpl(
      _TodoListState _value, $Res Function(_TodoListState) _then)
      : super(_value, (v) => _then(v as _TodoListState));

  @override
  _TodoListState get _value => super._value as _TodoListState;

  @override
  $Res call({
    Object? isLoaded = freezed,
    Object? isOldLoadable = freezed,
    Object? todoList = freezed,
  }) {
    return _then(_TodoListState(
      isLoaded: isLoaded == freezed
          ? _value.isLoaded
          : isLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      isOldLoadable: isOldLoadable == freezed
          ? _value.isOldLoadable
          : isOldLoadable // ignore: cast_nullable_to_non_nullable
              as bool,
      todoList: todoList == freezed
          ? _value.todoList
          : todoList // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Todo>>,
    ));
  }
}

/// @nodoc

class _$_TodoListState with DiagnosticableTreeMixin implements _TodoListState {
  const _$_TodoListState(
      {this.isLoaded = false,
      this.isOldLoadable = false,
      this.todoList = const {}});

  @JsonKey()
  @override
  final bool isLoaded;
  @JsonKey()
  @override
  final bool isOldLoadable;
  @JsonKey()
  @override
  final Map<String, List<Todo>> todoList;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodoListState(isLoaded: $isLoaded, isOldLoadable: $isOldLoadable, todoList: $todoList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TodoListState'))
      ..add(DiagnosticsProperty('isLoaded', isLoaded))
      ..add(DiagnosticsProperty('isOldLoadable', isOldLoadable))
      ..add(DiagnosticsProperty('todoList', todoList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoListState &&
            const DeepCollectionEquality().equals(other.isLoaded, isLoaded) &&
            const DeepCollectionEquality()
                .equals(other.isOldLoadable, isOldLoadable) &&
            const DeepCollectionEquality().equals(other.todoList, todoList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoaded),
      const DeepCollectionEquality().hash(isOldLoadable),
      const DeepCollectionEquality().hash(todoList));

  @JsonKey(ignore: true)
  @override
  _$TodoListStateCopyWith<_TodoListState> get copyWith =>
      __$TodoListStateCopyWithImpl<_TodoListState>(this, _$identity);
}

abstract class _TodoListState implements TodoListState {
  const factory _TodoListState(
      {bool isLoaded,
      bool isOldLoadable,
      Map<String, List<Todo>> todoList}) = _$_TodoListState;

  @override
  bool get isLoaded;
  @override
  bool get isOldLoadable;
  @override
  Map<String, List<Todo>> get todoList;
  @override
  @JsonKey(ignore: true)
  _$TodoListStateCopyWith<_TodoListState> get copyWith =>
      throw _privateConstructorUsedError;
}
