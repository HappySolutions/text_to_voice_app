import 'package:flutter_tts/flutter_tts.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/domain/entities/mesage.dart';

import 'mark_message_as_read_use_case.dart';

class ConvertTextToSpeechUseCase {
  final FlutterTts ttsService;
  final MarkMessageAsReadUseCase markAsRead;

  ConvertTextToSpeechUseCase({
    required this.ttsService,
    required this.markAsRead,
  });

  Future<void> execute(Message message) async {
    await ttsService.setLanguage("ar-SA");
    await ttsService.setPitch(1.0);
    await ttsService.speak(message.content);
    await markAsRead.execute(message); // تحديث الحالة بعد القراءة
  }
}
