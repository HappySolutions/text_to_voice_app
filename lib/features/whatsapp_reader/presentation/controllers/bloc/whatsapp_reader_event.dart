part of 'whatsapp_reader_bloc.dart';

sealed class WhatsAppReaderEvent {}

class ReceiveMessageEvent extends WhatsAppReaderEvent {}

class ConvertToSpeechEvent extends WhatsAppReaderEvent {
  final Message message;
  ConvertToSpeechEvent(this.message);
}

class MarkMessageAsReadEvent extends WhatsAppReaderEvent {
  final Message message;
  MarkMessageAsReadEvent(this.message);
}
