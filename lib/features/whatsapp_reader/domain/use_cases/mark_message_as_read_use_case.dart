import 'package:text_to_voice_app/features/whatsapp_reader/domain/entities/mesage.dart';

class MarkMessageAsReadUseCase {
  final MessageRepository repository; // نحتاج الـ Repository هنا

  Future<void> execute(Message message) async {
    if (message.isUnread) {
      message = message.copyWith(isUnread: false); // تحديث الحالة
      await repository.updateMessage(updatedMessage); // حفظ التغيير
    }
  }
}
