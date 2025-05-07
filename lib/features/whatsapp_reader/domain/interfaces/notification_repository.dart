import 'package:text_to_voice_app/features/whatsapp_reader/domain/entities/mesage.dart';

abstract class NotificationRepository {
  Future<Message> getLatestNotification();
}
