abstract class NotificationsRepository {
  Future<bool> setNotification(
      int id, String title, String body, DateTime scheduleAt);
  Future<bool> cancelNotification(int id);
}
