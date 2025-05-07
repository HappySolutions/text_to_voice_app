import 'package:text_to_voice_app/features/whatsapp_reader/domain/entities/mesage.dart';

class MessageModel extends Message {
  final String id;
  final String content;
  final String sender;
  final DateTime timestamp;
  final bool isUnread;

  MessageModel({
    required this.id,
    required this.content,
    required this.sender,
    this.isUnread = true,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now(),
       super(id: '', content: '', sender: '');

  // تحويل الـ MessageModel إلى Message entity
  Message toEntity() {
    return Message(
      id: id,
      content: content,
      sender: sender,
      isUnread: isUnread,
      timestamp: timestamp,
    );
  }

  // تحويل الـ Message entity إلى MessageModel
  static MessageModel fromEntity(Message entity) {
    return MessageModel(
      id: entity.id,
      content: entity.content,
      sender: entity.sender,
      isUnread: entity.isUnread,
      timestamp: entity.timestamp,
    );
  }
}
