import 'package:uuid/uuid.dart';

class StrUtils {
  static String createUuid() {
    var uuid = Uuid();
    print("hoge");
    return uuid.v4();
  }
}
