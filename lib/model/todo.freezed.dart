// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return _Todo.fromJson(json);
}

/// @nodoc
class _$TodoTearOff {
  const _$TodoTearOff();

  _Todo call(
      @HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) DateTime eventAt,
      @HiveField(3) double latitude,
      @HiveField(4) double longitude,
      @HiveField(5) String? locationName,
      @HiveField(6) DateTime createdAt,
      @HiveField(7) DateTime updatedAt,
      @HiveField(8) int noticeId) {
    return _Todo(
      id,
      title,
      eventAt,
      latitude,
      longitude,
      locationName,
      createdAt,
      updatedAt,
      noticeId,
    );
  }

  Todo fromJson(Map<String, Object> json) {
    return Todo.fromJson(json);
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
  double get latitude => throw _privateConstructorUsedError;
  @HiveField(4)
  double get longitude => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get locationName => throw _privateConstructorUsedError;
  @HiveField(6)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @HiveField(8)
  int get noticeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
      @HiveField(3) double latitude,
      @HiveField(4) double longitude,
      @HiveField(5) String? locationName,
      @HiveField(6) DateTime createdAt,
      @HiveField(7) DateTime updatedAt,
      @HiveField(8) int noticeId});
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
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? locationName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? noticeId = freezed,
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
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      locationName: locationName == freezed
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      noticeId: noticeId == freezed
          ? _value.noticeId
          : noticeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
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
      @HiveField(3) double latitude,
      @HiveField(4) double longitude,
      @HiveField(5) String? locationName,
      @HiveField(6) DateTime createdAt,
      @HiveField(7) DateTime updatedAt,
      @HiveField(8) int noticeId});
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
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? locationName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? noticeId = freezed,
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
      latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      locationName == freezed
          ? _value.locationName
          : locationName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      noticeId == freezed
          ? _value.noticeId
          : noticeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'TodoAdapter')
class _$_Todo extends _Todo with DiagnosticableTreeMixin {
  const _$_Todo(
      @HiveField(0) this.id,
      @HiveField(1) this.title,
      @HiveField(2) this.eventAt,
      @HiveField(3) this.latitude,
      @HiveField(4) this.longitude,
      @HiveField(5) this.locationName,
      @HiveField(6) this.createdAt,
      @HiveField(7) this.updatedAt,
      @HiveField(8) this.noticeId)
      : super._();

  factory _$_Todo.fromJson(Map<String, dynamic> json) => _$$_TodoFromJson(json);

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
  final double latitude;
  @override
  @HiveField(4)
  final double longitude;
  @override
  @HiveField(5)
  final String? locationName;
  @override
  @HiveField(6)
  final DateTime createdAt;
  @override
  @HiveField(7)
  final DateTime updatedAt;
  @override
  @HiveField(8)
  final int noticeId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Todo(id: $id, title: $title, eventAt: $eventAt, latitude: $latitude, longitude: $longitude, locationName: $locationName, createdAt: $createdAt, updatedAt: $updatedAt, noticeId: $noticeId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Todo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('eventAt', eventAt))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('locationName', locationName))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('noticeId', noticeId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Todo &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.eventAt, eventAt) ||
                const DeepCollectionEquality()
                    .equals(other.eventAt, eventAt)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.locationName, locationName) ||
                const DeepCollectionEquality()
                    .equals(other.locationName, locationName)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.noticeId, noticeId) ||
                const DeepCollectionEquality()
                    .equals(other.noticeId, noticeId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(eventAt) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(locationName) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(noticeId);

  @JsonKey(ignore: true)
  @override
  _$TodoCopyWith<_Todo> get copyWith =>
      __$TodoCopyWithImpl<_Todo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoToJson(this);
  }
}

abstract class _Todo extends Todo {
  const factory _Todo(
      @HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) DateTime eventAt,
      @HiveField(3) double latitude,
      @HiveField(4) double longitude,
      @HiveField(5) String? locationName,
      @HiveField(6) DateTime createdAt,
      @HiveField(7) DateTime updatedAt,
      @HiveField(8) int noticeId) = _$_Todo;
  const _Todo._() : super._();

  factory _Todo.fromJson(Map<String, dynamic> json) = _$_Todo.fromJson;

  @override
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  DateTime get eventAt => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  double get latitude => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  double get longitude => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  String? get locationName => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  int get noticeId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TodoCopyWith<_Todo> get copyWith => throw _privateConstructorUsedError;
}
