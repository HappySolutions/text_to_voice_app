import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/presentation/controllers/bloc/whatsapp_reader_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WhatsApp Reader')),
      body: SafeArea(
        child: BlocConsumer<WhatsAppReaderBloc, WhatsAppReaderState>(
          listener: (context, state) {
            if (state is WhatsAppReaderErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.message}')),
              );
            }
          },
          builder: (context, state) {
            if (state is WhatsAppReaderLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is WhatsAppReaderMessageReceivedState) {
              final message = state.message;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sender: ${message.sender}'),
                    SizedBox(height: 8),
                    Text('Message: ${message.content}'),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<WhatsAppReaderBloc>(
                              context,
                            ).add(ConvertToSpeechEvent(message));
                          },
                          child: Text('Convert to Speech'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<WhatsAppReaderBloc>(
                              context,
                            ).add(MarkMessageAsReadEvent(message));
                          },
                          child: Text('Mark as Read'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<WhatsAppReaderBloc>(
                      context,
                    ).add(ReceiveMessageEvent());
                  },
                  child: Text('Receive Message'),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
