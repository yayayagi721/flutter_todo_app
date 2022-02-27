import 'package:flutter_todo_app/const/hive_const.dart';
import 'package:flutter_todo_app/repository/id_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class IdRepositoryImpl implements IdRepository {
  int createNotificationId() {
    final notificationId =
        Hive.box(BoxName.id).get(Id.notificationId, defaultValue: 0);
    final newId = notificationId + 1;
    Hive.box(BoxName.id).put(Id.notificationId, newId);
    return newId;
  }

  String createTodoId() {
    var uuid = Uuid();
    return uuid.v4();
  }
}
