import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'location_info.freezed.dart';
part 'location_info.g.dart';

@freezed
class LocationInfo with _$LocationInfo {
  @HiveType(typeId: 1, adapterName: 'LocationInfoAdapter')
  const factory LocationInfo(
      @HiveField(0) double latitude, @HiveField(1) double longitude,
      [@Default(null) @HiveField(2) String? address]) = _LocationInfo;
}
