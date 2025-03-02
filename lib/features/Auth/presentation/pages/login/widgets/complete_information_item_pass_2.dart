import 'package:flutter/material.dart';
import 'package:NovaHealth/core/widgets/password_text_field.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';

class CompleteInfoItemPass2 extends StatelessWidget {
  const CompleteInfoItemPass2({
    Key? key,
    required this.text,
    this.width,
    this.height,
    required this.controller,
  }) : super(key: key);

  final String text;
  final double? width;
  final double? height;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: text,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: Color(0xff0c0b0b),
              fontWeight: FontWeight.w400,
            ),
            children: const [
              TextSpan(
                text: ' *',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        PasswordTextField(
          width: width,
          height: height,
          controller: controller, // ✅ Added controller here
          onSaved: (value) {
            print("Password saved: $value");
          },
          onChanged: (value) {
            print("Password changed: $value");
          },
        ),
      ],
    );
  }
}
