import 'package:bloc/bloc.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/domain/entities/mesage.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/domain/use_cases/convert_text_to_speach_use_case.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/domain/use_cases/mark_message_as_read_use_case.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/domain/use_cases/recive_message_use_case.dart';

part 'whatsapp_reader_event.dart';
part 'whatsapp_reader_state.dart';

class WhatsAppReaderBloc
    extends Bloc<WhatsAppReaderEvent, WhatsAppReaderState> {
  final ReceiveMessageUseCase receiveMessageUseCase;
  final ConvertTextToSpeechUseCase convertTextToSpeechUseCase;
  final MarkMessageAsReadUseCase markMessageAsReadUseCase;

  WhatsAppReaderBloc({
    required this.receiveMessageUseCase,
    required this.convertTextToSpeechUseCase,
    required this.markMessageAsReadUseCase,
  }) : super(WhatsAppReaderInitialState());

  Stream<WhatsAppReaderState> mapEventToState(
    WhatsAppReaderEvent event,
  ) async* {
    if (event is ReceiveMessageEvent) {
      yield WhatsAppReaderLoadingState();
      try {
        final message = await receiveMessageUseCase.execute();
        yield WhatsAppReaderMessageReceivedState(message);
      } catch (e) {
        yield WhatsAppReaderErrorState(e.toString());
      }
    } else if (event is ConvertToSpeechEvent) {
      yield WhatsAppReaderLoadingState();
      try {
        await convertTextToSpeechUseCase.execute(event.message);
        await markMessageAsReadUseCase.execute(event.message);
        yield WhatsAppReaderMessageReceivedState(event.message);
      } catch (e) {
        yield WhatsAppReaderErrorState(e.toString());
      }
    } else if (event is MarkMessageAsReadEvent) {
      try {
        await markMessageAsReadUseCase.execute(event.message);
        yield WhatsAppReaderMessageReceivedState(event.message);
      } catch (e) {
        yield WhatsAppReaderErrorState(e.toString());
      }
    }
  }
}
