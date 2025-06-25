import 'package:flutter/material.dart';
import '../../data/services/chat_gpt_service.dart';
import '../widgets/formatted_text.dart';

class ChatbotPageBody extends StatefulWidget {
  const ChatbotPageBody({super.key});

  @override
  State<ChatbotPageBody> createState() => _ChatbotPageBodyState();
}

class _ChatbotPageBodyState extends State<ChatbotPageBody> {
  final List<Widget> _messages = [];
  final Set<String> _pressedButtons = {};
  String? _selectedButton;
  bool _showUnpressedButtons = true;
  final TextEditingController _medicineController = TextEditingController();
  bool _showMedicineInput = false;
  bool _isLoading = false;
  final ChatGptService _chatGptService = ChatGptService();
  final Map<String, String> _responses = {
    'Consultation': '''To make a consultation:
1. Press the 'Consultation' button on the home page.
2. Choose the department.
3. Select the doctor you want to make an appointment with.
4. Choose your preferred time.
5. Select your payment method.
✅ Your reservation is done!''',
    'Laboratory': '''To reserve a laboratory test:
1. Press the 'Laboratory' button on the home page.
2. Choose your preferred time.
3. Select your payment method.
✅ Your reservation is done!''',
    'Radiology': '''To reserve a radiology service:
1. Press the 'Radiology' button on the home page.
2. Choose your preferred time.
3. Select your payment method.
✅ Your reservation is done!'''
  };
  String? _currentlyPressedButton;
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _addInitialMessages();
  }

  @override
  void dispose() {
    _medicineController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _addInitialMessages() {
    _messages.add(const ChatMessage(text: "Hello!", isUser: false));
    _messages.add(const ChatMessage(text: "Welcome to Nova Health.", isUser: false));
    _addButtons();
    _scrollToBottom();
  }

  void _addButtons() {
    _messages.add(
      Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (_currentlyPressedButton == null && !_pressedButtons.contains('Consultation'))
                  _buildButton('Consultation'),
                if (_currentlyPressedButton == null && !_pressedButtons.contains('Laboratory'))
                  _buildButton('Laboratory'),
                if (_currentlyPressedButton == null && !_pressedButtons.contains('Radiology'))
                  _buildButton('Radiology'),
                if (_currentlyPressedButton != null)
                  _buildButton(_currentlyPressedButton!),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: _showMedicineQuery,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            child: const Text('To Ask About Medicine Press Here'),
          ),
        ],
      ),
    );
    _scrollToBottom();
  }

  void _handleButtonPress(String buttonType) {
    if (_pressedButtons.contains(buttonType)) return;
    setState(() {
      _currentlyPressedButton = buttonType;
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _messages.add(ChatMessage(
          text: _responses[buttonType]!,
          isUser: false,
        ));
        _pressedButtons.add(buttonType);
        _currentlyPressedButton = null;
        if (_pressedButtons.length < 3) {
          _addButtons();
        }
        _scrollToBottom();
      });
    });
  }

  void _showMedicineQuery() {
    setState(() {
      _messages.add(const ChatMessage(
        text: "What is the medicine you want to know its benefits and side effects?",
        isUser: false,
      ));
      _showMedicineInput = true;
      _scrollToBottom();
    });
  }

  void _handleMedicineQuery() async {
    final String medicineName = _medicineController.text.trim();

    if (medicineName.isEmpty) return;

    setState(() {
      _isLoading = true;

      // Show user message
      _messages.add(ChatMessage(
        text: medicineName,
        isUser: true,
      ));

      // Show loading message
      _messages.add(const ChatMessage(
        text: "I'm analyzing the medicine information. Please wait...",
        isUser: false,
      ));

      _medicineController.clear();
      _showMedicineInput = false;
      _scrollToBottom();
    });

    try {
      final response = await _chatGptService.getMedicineInfo(medicineName);

      setState(() {
        _messages.removeLast(); // remove loading message
        _messages.add(ChatMessage(
          text: response,
          isUser: false,
        ));
        _isLoading = false;
        _showMedicineInput = true;
        _scrollToBottom();
      });
    } catch (e) {
      setState(() {
        _messages.removeLast(); // remove loading
        _messages.add(const ChatMessage(
          text: "Sorry, I encountered an error. Please try again.",
          isUser: false,
        ));
        _isLoading = false;
        _showMedicineInput = true;
        _scrollToBottom();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/BG.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.grey[100]?.withOpacity(0.6),
            child: SizedBox.expand(
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpace(5),
                    Row(
                      children: [
                        HorizontalSpace(1),
                        const SizedBox(width: 12),
                        const Text(
                          'Nova Bot',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    ..._messages,
                    if (_showMedicineInput)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, -1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _medicineController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter medicine name...',
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                ),
                                enabled: !_isLoading,
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: _isLoading ? null : _handleMedicineQuery,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              child: _isLoading
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      ),
                                    )
                                  : const Text('Ask'),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () => _handleButtonPress(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        minimumSize: const Size(80, 36),
      ),
      child: Text(text),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatMessage({
    super.key,
    required this.text,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser)
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  'assets/images/Ai bot.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isUser ? Colors.blue : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: isUser 
                ? Text(
                text,
                style: TextStyle(
                  color: isUser ? Colors.white : Colors.black,
                ),
                  )
                : FormattedText(
                    text: text,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
              ),
            ),
          ),
          if (isUser)
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: const CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}

class VerticalSpace extends StatelessWidget {
  final double height;
  const VerticalSpace(this.height, {super.key});
  @override
  Widget build(BuildContext context) => SizedBox(height: height * 8);
}

class HorizontalSpace extends StatelessWidget {
  final double width;
  const HorizontalSpace(this.width, {super.key});
  @override
  Widget build(BuildContext context) => SizedBox(width: width * 8);
}
