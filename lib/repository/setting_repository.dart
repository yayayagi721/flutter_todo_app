import 'package:flutter_todo_app/model/location_info.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class SettingRepository {
  int getRemaindInterval();
  LocationInfo getDefaultLocationInfo();
  bool setRemaindInterval(int interval);
  bool setDefaultLocationInfo(LocationInfo locationInfo);
}
