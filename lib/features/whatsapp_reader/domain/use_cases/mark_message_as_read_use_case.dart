import 'package:text_to_voice_app/features/whatsapp_reader/domain/entities/mesage.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/domain/interfaces/message_repository.dart';

class MarkMessageAsReadUseCase {
  final MessageRepository repository;

  MarkMessageAsReadUseCase(this.repository);

  Future<void> execute(Message message) async {
    if (message.isUnread) {
      final updatedMessage = message.copyWith(isUnread: false);
      await repository.updateMessage(updatedMessage);
    }
  }
}
