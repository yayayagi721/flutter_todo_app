//hiveで使用するBox名
class BoxName {
  //TODOリスト画面の永続化用Box名
  static const String todoList = "todo_list";
  //設定画面の永続化用Box名
  static const String setting = "setting";
  //BOX作るほどじゃないけど保存したい値を入れる
  static const String commonValue = "commonValue";
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
