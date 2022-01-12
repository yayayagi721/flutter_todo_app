import 'package:flutter_todo_app/const/common.dart';
import 'package:flutter_todo_app/const/hive_const.dart';
import 'package:flutter_todo_app/model/location_info.dart';
import 'package:flutter_todo_app/repository/setting_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';

class SettingRepositoryImpl implements SettingRepository {
  @override
  LocationInfo getDefaultLocationInfo() {
    final info = Hive.box(BoxName.setting).get(SettingKey.defaultLocationInfo);

    if (info == null) {
      return LocationInfo(CommonConst.initPosLat, CommonConst.initPosLng);
    }
    return info;
  }

  @override
  int getRemaindInterval() => Hive.box(BoxName.setting)
      .get(SettingKey.remaindInterval, defaultValue: 10);

  @override
  bool setDefaultLocationInfo(LocationInfo locationInfo) {
    Hive.box(BoxName.setting).put(SettingKey.defaultLocationInfo, locationInfo);
    return true;
  }

  @override
  bool setRemaindInterval(int interval) {
    Hive.box(BoxName.setting).put(SettingKey.remaindInterval, interval);
    return true;
  }
}
