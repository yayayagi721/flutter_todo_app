// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodoTearOff {
  const _$TodoTearOff();

  _Todo call(
      @HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) DateTime eventAt,
      @HiveField(3) LocationInfo locationInfo,
      @HiveField(4) DateTime createdAt,
      @HiveField(5) DateTime updatedAt,
      @HiveField(6) int? notificationId,
      @HiveField(7) int? notifyInAdvanceVal) {
    return _Todo(
      id,
      title,
      eventAt,
      locationInfo,
      createdAt,
      updatedAt,
      notificationId,
      notifyInAdvanceVal,
    );
  }
}

/// @nodoc
const $Todo = _$TodoTearOff();

/// @nodoc
mixin _$Todo {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get eventAt => throw _privateConstructorUsedError;
  @HiveField(3)
  LocationInfo get locationInfo => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @HiveField(6)
  int? get notificationId => throw _privateConstructorUsedError;
  @HiveField(7)
  int? get notifyInAdvanceVal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoCopyWith<Todo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
      _$TodoCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) DateTime eventAt,
      @HiveField(3) LocationInfo locationInfo,
      @HiveField(4) DateTime createdAt,
      @HiveField(5) DateTime updatedAt,
      @HiveField(6) int? notificationId,
      @HiveField(7) int? notifyInAdvanceVal});

  $LocationInfoCopyWith<$Res> get locationInfo;
}

/// @nodoc
class _$TodoCopyWithImpl<$Res> implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  final Todo _value;
  // ignore: unused_field
  final $Res Function(Todo) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? eventAt = freezed,
    Object? locationInfo = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? notificationId = freezed,
    Object? notifyInAdvanceVal = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      eventAt: eventAt == freezed
          ? _value.eventAt
          : eventAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      locationInfo: locationInfo == freezed
          ? _value.locationInfo
          : locationInfo // ignore: cast_nullable_to_non_nullable
              as LocationInfo,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notificationId: notificationId == freezed
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int?,
      notifyInAdvanceVal: notifyInAdvanceVal == freezed
          ? _value.notifyInAdvanceVal
          : notifyInAdvanceVal // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $LocationInfoCopyWith<$Res> get locationInfo {
    return $LocationInfoCopyWith<$Res>(_value.locationInfo, (value) {
      return _then(_value.copyWith(locationInfo: value));
    });
  }
}

/// @nodoc
abstract class _$TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$TodoCopyWith(_Todo value, $Res Function(_Todo) then) =
      __$TodoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) DateTime eventAt,
      @HiveField(3) LocationInfo locationInfo,
      @HiveField(4) DateTime createdAt,
      @HiveField(5) DateTime updatedAt,
      @HiveField(6) int? notificationId,
      @HiveField(7) int? notifyInAdvanceVal});

  @override
  $LocationInfoCopyWith<$Res> get locationInfo;
}

/// @nodoc
class __$TodoCopyWithImpl<$Res> extends _$TodoCopyWithImpl<$Res>
    implements _$TodoCopyWith<$Res> {
  __$TodoCopyWithImpl(_Todo _value, $Res Function(_Todo) _then)
      : super(_value, (v) => _then(v as _Todo));

  @override
  _Todo get _value => super._value as _Todo;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? eventAt = freezed,
    Object? locationInfo = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? notificationId = freezed,
    Object? notifyInAdvanceVal = freezed,
  }) {
    return _then(_Todo(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      eventAt == freezed
          ? _value.eventAt
          : eventAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      locationInfo == freezed
          ? _value.locationInfo
          : locationInfo // ignore: cast_nullable_to_non_nullable
              as LocationInfo,
      createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notificationId == freezed
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int?,
      notifyInAdvanceVal == freezed
          ? _value.notifyInAdvanceVal
          : notifyInAdvanceVal // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0, adapterName: 'TodoAdapter')
class _$_Todo extends _Todo with DiagnosticableTreeMixin {
  const _$_Todo(
      @HiveField(0) this.id,
      @HiveField(1) this.title,
      @HiveField(2) this.eventAt,
      @HiveField(3) this.locationInfo,
      @HiveField(4) this.createdAt,
      @HiveField(5) this.updatedAt,
      @HiveField(6) this.notificationId,
      @HiveField(7) this.notifyInAdvanceVal)
      : super._();

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final DateTime eventAt;
  @override
  @HiveField(3)
  final LocationInfo locationInfo;
  @override
  @HiveField(4)
  final DateTime createdAt;
  @override
  @HiveField(5)
  final DateTime updatedAt;
  @override
  @HiveField(6)
  final int? notificationId;
  @override
  @HiveField(7)
  final int? notifyInAdvanceVal;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Todo(id: $id, title: $title, eventAt: $eventAt, locationInfo: $locationInfo, createdAt: $createdAt, updatedAt: $updatedAt, notificationId: $notificationId, notifyInAdvanceVal: $notifyInAdvanceVal)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Todo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('eventAt', eventAt))
      ..add(DiagnosticsProperty('locationInfo', locationInfo))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('notificationId', notificationId))
      ..add(DiagnosticsProperty('notifyInAdvanceVal', notifyInAdvanceVal));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Todo &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.eventAt, eventAt) &&
            const DeepCollectionEquality()
                .equals(other.locationInfo, locationInfo) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.notificationId, notificationId) &&
            const DeepCollectionEquality()
                .equals(other.notifyInAdvanceVal, notifyInAdvanceVal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(eventAt),
      const DeepCollectionEquality().hash(locationInfo),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(notificationId),
      const DeepCollectionEquality().hash(notifyInAdvanceVal));

  @JsonKey(ignore: true)
  @override
  _$TodoCopyWith<_Todo> get copyWith =>
      __$TodoCopyWithImpl<_Todo>(this, _$identity);
}

abstract class _Todo extends Todo {
  const factory _Todo(
      @HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) DateTime eventAt,
      @HiveField(3) LocationInfo locationInfo,
      @HiveField(4) DateTime createdAt,
      @HiveField(5) DateTime updatedAt,
      @HiveField(6) int? notificationId,
      @HiveField(7) int? notifyInAdvanceVal) = _$_Todo;
  const _Todo._() : super._();

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  DateTime get eventAt;
  @override
  @HiveField(3)
  LocationInfo get locationInfo;
  @override
  @HiveField(4)
  DateTime get createdAt;
  @override
  @HiveField(5)
  DateTime get updatedAt;
  @override
  @HiveField(6)
  int? get notificationId;
  @override
  @HiveField(7)
  int? get notifyInAdvanceVal;
  @override
  @JsonKey(ignore: true)
  _$TodoCopyWith<_Todo> get copyWith => throw _privateConstructorUsedError;
}
