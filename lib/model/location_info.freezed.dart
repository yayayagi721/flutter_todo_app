// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocationInfoTearOff {
  const _$LocationInfoTearOff();

  _LocationInfo call(
      @HiveField(0) double latitude, @HiveField(1) double longitude,
      [@HiveField(2) String? address = null]) {
    return _LocationInfo(
      latitude,
      longitude,
      address,
    );
  }
}

/// @nodoc
const $LocationInfo = _$LocationInfoTearOff();

/// @nodoc
mixin _$LocationInfo {
  @HiveField(0)
  double get latitude => throw _privateConstructorUsedError;
  @HiveField(1)
  double get longitude => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get address => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationInfoCopyWith<LocationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationInfoCopyWith<$Res> {
  factory $LocationInfoCopyWith(
          LocationInfo value, $Res Function(LocationInfo) then) =
      _$LocationInfoCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) double latitude,
      @HiveField(1) double longitude,
      @HiveField(2) String? address});
}

/// @nodoc
class _$LocationInfoCopyWithImpl<$Res> implements $LocationInfoCopyWith<$Res> {
  _$LocationInfoCopyWithImpl(this._value, this._then);

  final LocationInfo _value;
  // ignore: unused_field
  final $Res Function(LocationInfo) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LocationInfoCopyWith<$Res>
    implements $LocationInfoCopyWith<$Res> {
  factory _$LocationInfoCopyWith(
          _LocationInfo value, $Res Function(_LocationInfo) then) =
      __$LocationInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) double latitude,
      @HiveField(1) double longitude,
      @HiveField(2) String? address});
}

/// @nodoc
class __$LocationInfoCopyWithImpl<$Res> extends _$LocationInfoCopyWithImpl<$Res>
    implements _$LocationInfoCopyWith<$Res> {
  __$LocationInfoCopyWithImpl(
      _LocationInfo _value, $Res Function(_LocationInfo) _then)
      : super(_value, (v) => _then(v as _LocationInfo));

  @override
  _LocationInfo get _value => super._value as _LocationInfo;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? address = freezed,
  }) {
    return _then(_LocationInfo(
      latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1, adapterName: 'LocationInfoAdapter')
class _$_LocationInfo with DiagnosticableTreeMixin implements _LocationInfo {
  const _$_LocationInfo(
      @HiveField(0) this.latitude, @HiveField(1) this.longitude,
      [@HiveField(2) this.address = null]);

  @override
  @HiveField(0)
  final double latitude;
  @override
  @HiveField(1)
  final double longitude;
  @JsonKey()
  @override
  @HiveField(2)
  final String? address;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocationInfo(latitude: $latitude, longitude: $longitude, address: $address)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocationInfo'))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('address', address));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationInfo &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  _$LocationInfoCopyWith<_LocationInfo> get copyWith =>
      __$LocationInfoCopyWithImpl<_LocationInfo>(this, _$identity);
}

abstract class _LocationInfo implements LocationInfo {
  const factory _LocationInfo(
      @HiveField(0) double latitude, @HiveField(1) double longitude,
      [@HiveField(2) String? address]) = _$_LocationInfo;

  @override
  @HiveField(0)
  double get latitude;
  @override
  @HiveField(1)
  double get longitude;
  @override
  @HiveField(2)
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$LocationInfoCopyWith<_LocationInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
