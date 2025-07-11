import 'package:chatbox/models/notification_model.dart';
import 'package:chatbox/services/notification_service.dart';

class NotificationRepository {
  final NotificationService _notificationService;

  NotificationRepository({required NotificationService notificationService})
      : _notificationService = notificationService;

  Future<List<NotificationModel>> getNotifications(String userId) async {
    try {
      final notifications = await _notificationService.getUserNotifications(userId);
      return notifications;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> markAsRead(String notificationId) async {
    try {
      await _notificationService.markAsRead(notificationId);
    } catch (e) {
      rethrow;
    }
  }
}