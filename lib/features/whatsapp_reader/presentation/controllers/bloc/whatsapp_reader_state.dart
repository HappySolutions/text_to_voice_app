part of 'whatsapp_reader_bloc.dart';

sealed class WhatsAppReaderState {}

class WhatsAppReaderInitialState extends WhatsAppReaderState {}

class WhatsAppReaderLoadingState extends WhatsAppReaderState {}

class WhatsAppReaderMessageReceivedState extends WhatsAppReaderState {
  final Message message;
  WhatsAppReaderMessageReceivedState(this.message);
}

class WhatsAppReaderErrorState extends WhatsAppReaderState {
  final String message;
  WhatsAppReaderErrorState(this.message);
}
