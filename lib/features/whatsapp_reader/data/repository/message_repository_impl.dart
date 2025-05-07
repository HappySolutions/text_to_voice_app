import 'package:text_to_voice_app/features/whatsapp_reader/data/datasource/message_local_datasource.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/data/models/message_model.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/domain/entities/mesage.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/domain/interfaces/message_repository.dart';

class MessageRepositoryImpl implements MessageRepository {
  final MessageLocalDataSource localDataSource;

  MessageRepositoryImpl(this.localDataSource);

  @override
  Future<void> updateMessage(Message message) async {
    final messageModel = MessageModel.fromEntity(
      message,
    ); // تحويل لـ MessageModel
    await localDataSource.updateMessage(messageModel);
  }

  @override
  Future<void> saveMessage(Message message) async {
    final messageModel = MessageModel.fromEntity(
      message,
    ); // تحويل لـ MessageModel
    await localDataSource.saveMessage(messageModel);
  }

  @override
  Future<List<Message>> getUnreadMessages() async {
    final messageModels = await localDataSource.getMessages();
    return messageModels;
  }
}
