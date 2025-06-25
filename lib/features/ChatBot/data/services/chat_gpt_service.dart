import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ChatGptService {
  static const String _apiKey = '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';
  static const String _apiUrl = 'https://openrouter.ai/api/v1/chat/completions';

  Future<String> getMedicineInfo(String medicineName) async {
    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
          'HTTP-Referer': 'http://localhost', // Or your production site
          'X-Title': 'NovaHealth ChatBot',
        },
        body: jsonEncode({
          'model': 'deepseek/deepseek-r1-0528:free', // You can change the model here
          'messages': [
            {
              'role': 'system',
              'content':
                  'You are a medical assistant. Provide information about medicines in a clear, concise format. Include benefits and side effects. Always reply in the same language as the user\'s question. You can use formatting: use *text* for italic and **text** for bold to emphasize important information.',
            },
            {
              'role': 'user',
              'content': 'What are the benefits and side effects of $medicineName?',
            },
          ],
          'temperature': 0.2,
          'max_tokens': 2048,
        }),
      );

      print('Status: ${response.statusCode}');
      print('Response: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String content = data['choices'][0]['message']['content'];
        return formatResponse(content);
      } else {
        return 'API Error: ${response.statusCode}\n${response.body}';
      }
    } catch (e, stack) {
      print('Exception: $e');
      print('Stack trace: $stack');
      return 'Sorry, I encountered an error while fetching information about $medicineName. Please try again later.';
    }
  }

  // Format the response to handle bold and italic markdown
  String formatResponse(String text) {
    // Replace **text** with bold formatting
    final boldPattern = RegExp(r'\*\*(.*?)\*\*');
    text = text.replaceAllMapped(boldPattern, (match) => '<b>${match.group(1)}</b>');
    
    // Replace *text* with italic formatting
    final italicPattern = RegExp(r'\*(.*?)\*');
    text = text.replaceAllMapped(italicPattern, (match) => '<i>${match.group(1)}</i>');
    
    return text;
  }
}
