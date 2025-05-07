import 'package:text_to_voice_app/features/whatsapp_reader/domain/entities/mesage.dart';

class ReceiveMessageUseCase {
  final NotificationRepository repository; // هنتكلم عليها بعدين

  Future<Message> execute() async {
    final notification = await repository.getLatestNotification();
    return Message(content: notification.message, sender: notification.sender);
  }
}
