import 'package:flutter_todo_app/model/location_info.dart';

abstract class SettingRepository {
  int getRemaindInterval();
  LocationInfo? getDefaultLocationInfo();
  bool setRemaindInterval(int interval);
  bool setDefaultLocationInfo(LocationInfo locationInfo);
}
