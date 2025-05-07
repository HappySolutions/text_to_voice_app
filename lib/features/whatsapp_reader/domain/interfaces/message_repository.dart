import 'package:text_to_voice_app/features/whatsapp_reader/domain/entities/mesage.dart';

abstract class MessageRepository {
  Future<void> updateMessage(Message message);
  Future<void> saveMessage(Message message);
  Future<List<Message>> getUnreadMessages();
}
