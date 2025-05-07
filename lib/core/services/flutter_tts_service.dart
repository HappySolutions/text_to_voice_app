import 'package:flutter_tts/flutter_tts.dart';
import 'package:text_to_voice_app/core/services/text_to_speech_service.dart';

class FlutterTtsService implements TextToSpeechService {
  final FlutterTts _tts;

  FlutterTtsService(this._tts);

  @override
  Future<void> speak(String text) async {
    await _tts.setLanguage("ar-SA");
    await _tts.setPitch(1.0);
    await _tts.speak(text);
  }
}
