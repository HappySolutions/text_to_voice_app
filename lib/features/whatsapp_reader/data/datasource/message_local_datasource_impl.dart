import 'package:text_to_voice_app/features/whatsapp_reader/data/datasource/message_local_datasource.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/domain/entities/mesage.dart';

class MessageLocalDataSourceImpl implements MessageLocalDataSource {
  final List<Message> _messages = [];

  @override
  Future<List<Message>> getMessages() async {
    return _messages;
  }

  @override
  Future<void> saveMessage(Message message) async {
    _messages.add(message);
  }

  @override
  Future<void> updateMessage(Message message) async {
    final index = _messages.indexWhere((m) => m.id == message.id);
    if (index != -1) {
      _messages[index] = message;
    }
  }
}
