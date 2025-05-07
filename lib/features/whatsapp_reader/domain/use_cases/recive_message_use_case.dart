import 'package:text_to_voice_app/features/whatsapp_reader/domain/entities/mesage.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/domain/interfaces/notification_repository.dart';

class ReceiveMessageUseCase {
  final NotificationRepository repository;

  ReceiveMessageUseCase(this.repository);

  Future<Message> execute() async {
    final notification = await repository.getLatestNotification();
    return notification; // العودة بالـ Message مباشرة من NotificationRepository
  }
}
