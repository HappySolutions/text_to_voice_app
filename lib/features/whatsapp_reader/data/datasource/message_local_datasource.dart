import '../../domain/entities/mesage.dart' show Message;

abstract class MessageLocalDataSource {
  Future<List<Message>> getMessages();
  Future<void> saveMessage(Message message);
  Future<void> updateMessage(Message message);
}
