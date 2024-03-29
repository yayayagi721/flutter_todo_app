import 'package:flutter_todo_app/const/hive_const.dart';
import 'package:flutter_todo_app/model/location_info.dart';
import 'package:flutter_todo_app/repository/setting_repository.dart';
import 'package:hive/hive.dart';

class SettingRepositoryImpl implements SettingRepository {
  @override
  LocationInfo? getDefaultLocationInfo() {
    final info = Hive.box(BoxName.setting).get(Setting.defaultLocationInfo);
    return info;
  }

  @override
  int getRemaindInterval() =>
      Hive.box(BoxName.setting).get(Setting.remaindInterval, defaultValue: 10);

  @override
  bool setDefaultLocationInfo(LocationInfo locationInfo) {
    Hive.box(BoxName.setting).put(Setting.defaultLocationInfo, locationInfo);
    return true;
  }

  @override
  bool setRemaindInterval(int interval) {
    Hive.box(BoxName.setting).put(Setting.remaindInterval, interval);
    return true;
  }
}
