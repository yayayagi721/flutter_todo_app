// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
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
      {String? id = null,
      String title = "",
      LocationInfo? locationInfo = null,
      DateTime? eventTime = null,
      int? notifyInAdvanceVal = 360}) {
    return _TodoFormState(
      id: id,
      title: title,
      locationInfo: locationInfo,
      eventTime: eventTime,
      notifyInAdvanceVal: notifyInAdvanceVal,
    );
  }
}

/// @nodoc
const $TodoFormState = _$TodoFormStateTearOff();

/// @nodoc
mixin _$TodoFormState {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  LocationInfo? get locationInfo => throw _privateConstructorUsedError;
  DateTime? get eventTime => throw _privateConstructorUsedError;
  int? get notifyInAdvanceVal => throw _privateConstructorUsedError;

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
      {String? id,
      String title,
      LocationInfo? locationInfo,
      DateTime? eventTime,
      int? notifyInAdvanceVal});

  $LocationInfoCopyWith<$Res>? get locationInfo;
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
    Object? id = freezed,
    Object? title = freezed,
    Object? locationInfo = freezed,
    Object? eventTime = freezed,
    Object? notifyInAdvanceVal = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      locationInfo: locationInfo == freezed
          ? _value.locationInfo
          : locationInfo // ignore: cast_nullable_to_non_nullable
              as LocationInfo?,
      eventTime: eventTime == freezed
          ? _value.eventTime
          : eventTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notifyInAdvanceVal: notifyInAdvanceVal == freezed
          ? _value.notifyInAdvanceVal
          : notifyInAdvanceVal // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $LocationInfoCopyWith<$Res>? get locationInfo {
    if (_value.locationInfo == null) {
      return null;
    }

    return $LocationInfoCopyWith<$Res>(_value.locationInfo!, (value) {
      return _then(_value.copyWith(locationInfo: value));
    });
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
      {String? id,
      String title,
      LocationInfo? locationInfo,
      DateTime? eventTime,
      int? notifyInAdvanceVal});

  @override
  $LocationInfoCopyWith<$Res>? get locationInfo;
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
    Object? id = freezed,
    Object? title = freezed,
    Object? locationInfo = freezed,
    Object? eventTime = freezed,
    Object? notifyInAdvanceVal = freezed,
  }) {
    return _then(_TodoFormState(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      locationInfo: locationInfo == freezed
          ? _value.locationInfo
          : locationInfo // ignore: cast_nullable_to_non_nullable
              as LocationInfo?,
      eventTime: eventTime == freezed
          ? _value.eventTime
          : eventTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notifyInAdvanceVal: notifyInAdvanceVal == freezed
          ? _value.notifyInAdvanceVal
          : notifyInAdvanceVal // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_TodoFormState extends _TodoFormState with DiagnosticableTreeMixin {
  const _$_TodoFormState(
      {this.id = null,
      this.title = "",
      this.locationInfo = null,
      this.eventTime = null,
      this.notifyInAdvanceVal = 360})
      : super._();

  @JsonKey()
  @override
  final String? id;
  @JsonKey()
  @override
  final String title;
  @JsonKey()
  @override
  final LocationInfo? locationInfo;
  @JsonKey()
  @override
  final DateTime? eventTime;
  @JsonKey()
  @override
  final int? notifyInAdvanceVal;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodoFormState(id: $id, title: $title, locationInfo: $locationInfo, eventTime: $eventTime, notifyInAdvanceVal: $notifyInAdvanceVal)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TodoFormState'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('locationInfo', locationInfo))
      ..add(DiagnosticsProperty('eventTime', eventTime))
      ..add(DiagnosticsProperty('notifyInAdvanceVal', notifyInAdvanceVal));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoFormState &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.locationInfo, locationInfo) &&
            const DeepCollectionEquality().equals(other.eventTime, eventTime) &&
            const DeepCollectionEquality()
                .equals(other.notifyInAdvanceVal, notifyInAdvanceVal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(locationInfo),
      const DeepCollectionEquality().hash(eventTime),
      const DeepCollectionEquality().hash(notifyInAdvanceVal));

  @JsonKey(ignore: true)
  @override
  _$TodoFormStateCopyWith<_TodoFormState> get copyWith =>
      __$TodoFormStateCopyWithImpl<_TodoFormState>(this, _$identity);
}

abstract class _TodoFormState extends TodoFormState {
  const factory _TodoFormState(
      {String? id,
      String title,
      LocationInfo? locationInfo,
      DateTime? eventTime,
      int? notifyInAdvanceVal}) = _$_TodoFormState;
  const _TodoFormState._() : super._();

  @override
  String? get id;
  @override
  String get title;
  @override
  LocationInfo? get locationInfo;
  @override
  DateTime? get eventTime;
  @override
  int? get notifyInAdvanceVal;
  @override
  @JsonKey(ignore: true)
  _$TodoFormStateCopyWith<_TodoFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
