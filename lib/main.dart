import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_to_voice_app/core/services/text_to_speech_service.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/data/repository/message_repository_impl.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/data/repository/notification_repository_impl.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/domain/use_cases/convert_text_to_speach_use_case.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/domain/use_cases/mark_message_as_read_use_case.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/domain/use_cases/recive_message_use_case.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/presentation/controllers/bloc/whatsapp_reader_bloc.dart';
import 'package:text_to_voice_app/features/whatsapp_reader/presentation/screens/home_page.dart';

void main() {
  // إنشاء الـ services والـ data sources
  final textToSpeechService = TextToSpeechService();
  final localNotificationDataSource = LocalNotificationDataSourceImpl();

  // إنشاء الـ repositories
  final notificationRepository = NotificationRepositoryImpl(localNotificationDataSource);
  final messageRepository = MessageRepositoryImpl();

  // إنشاء الـ use cases
  final receiveMessageUseCase = ReceiveMessageUseCase(notificationRepository);
  final markMessageAsReadUseCase = MarkMessageAsReadUseCase(messageRepository);
  final convertTextToSpeechUseCase = ConvertTextToSpeechUseCase(ttsService: textToSpeechService,
    markAsRead: markMessageAsReadUseCase, 
  );

  // تشغيل التطبيق
  runApp(MyApp(
    receiveMessageUseCase: receiveMessageUseCase,
    convertTextToSpeechUseCase: convertTextToSpeechUseCase,
    markMessageAsReadUseCase: markMessageAsReadUseCase,
  ));
}

class MyApp extends StatelessWidget {
  final ReceiveMessageUseCase receiveMessageUseCase;
  final ConvertTextToSpeechUseCase convertTextToSpeechUseCase;
  final MarkMessageAsReadUseCase markMessageAsReadUseCase;

  const MyApp({
    Key? key,
    required this.receiveMessageUseCase,
    required this.convertTextToSpeechUseCase,
    required this.markMessageAsReadUseCase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text to Voice App',
      home: BlocProvider(
        create: (_) => WhatsAppReaderBloc(
          receiveMessageUseCase: receiveMessageUseCase,
          convertTextToSpeechUseCase: convertTextToSpeechUseCase,
          markMessageAsReadUseCase: markMessageAsReadUseCase,
        ),
        child: HomePage(),
      ),
    );
  }
}
