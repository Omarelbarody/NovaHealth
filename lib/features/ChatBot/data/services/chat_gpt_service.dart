import 'dart:convert';
import 'package:http/http.dart' as http;

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
          'HTTP-Referer': 'http://localhost', // Or your deployed app domain
          'X-Title': 'NovaHealth ChatBot'
        },
        body: jsonEncode({
          'model': 'deepseek/deepseek-prover-v2:free',
          'messages': [
            {
              'role': 'system',
              'content': 'You are a medical assistant. Provide information about medicines in a clear, concise format. Include benefits and side effects. Always reply in the same language as the user\'s question.',
            },
            {
              'role': 'user',
              'content': 'What are the benefits and side effects of $medicineName?',
            },
          ],
          'temperature': 0.7,
          'max_tokens': 500,
        }),
      );

      print('Status: ${response.statusCode}');
      print('Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        return 'API Error: ${response.statusCode}\n${response.body}';
      }
    } catch (e, stack) {
      print('Exception: $e');
      print('Stack trace: $stack');
      return 'Sorry, I encountered an error while fetching information about $medicineName. Please try again later.';
    }
  }
} 