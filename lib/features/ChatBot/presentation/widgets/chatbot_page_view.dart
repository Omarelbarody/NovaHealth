import 'package:NovaHealth/features/ChatBot/presentation/widgets/chatbot_page_body.dart';
import 'package:flutter/material.dart';

class ChatbotPageView extends StatelessWidget {
  const ChatbotPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatbotPageBody() ,
    );
  }
}