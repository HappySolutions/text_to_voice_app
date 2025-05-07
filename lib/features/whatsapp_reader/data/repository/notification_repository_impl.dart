import 'package:text_to_voice_app/features/whatsapp_reader/domain/entities/mesage.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/domain/interfaces/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  // لحد ما نستخدم نظام إشعارات حقيقي، هنخزن الإشعارات في memory.
  final List<Message> _notifications = [];

  @override
  Future<Message> getLatestNotification() async {
    if (_notifications.isNotEmpty) {
      return _notifications.last;
    } else {
      throw Exception("No notifications available");
    }
  }

  // إضافات مؤقتة للمحاكاة
  void addNotification(Message message) {
    _notifications.add(message);
  }
}
