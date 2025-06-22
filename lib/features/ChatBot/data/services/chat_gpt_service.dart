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
          'HTTP-Referer': 'http://localhost', // Or your production site
          'X-Title': 'NovaHealth ChatBot',
        },
        body: jsonEncode({
          'model': 'deepseek/deepseek-r1-0528:free', // You can change the model here
          'messages': [
            {
              'role': 'system',
              'content':
                  'You are a medical assistant. Provide information about medicines in a clear, concise format. Include benefits and side effects. Always reply in the same language as the user\'s question.',
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
      print('Response: ${response.body}');

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
