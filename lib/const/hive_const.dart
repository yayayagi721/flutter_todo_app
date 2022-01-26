//hiveで使用するBox名
class BoxName {
  //TODOリスト画面の永続化用Box名
  static const String todoList = "todo_list";
  //設定画面の永続化用Box名
  static const String setting = "setting";
  //IdRepositoryで使用するBox名
  static const String id = "id";
}

class Setting {
  //リマインド通知設定のKey
  static const String remaindInterval = "setting";
  //デフォルト位置情報のKey
  static const String defaultLocationInfo = "defaultLocationInfo";
}

class Id {
  //デフォルト位置情報のKey
  static const String notificationId = "notificationId";
}
