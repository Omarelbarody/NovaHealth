import 'package:flutter/material.dart';
import 'package:NovaHealth/core/widgets/password_text_field.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';

class CompleteInfoItemPass extends StatelessWidget {
  const CompleteInfoItemPass({
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
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Color(0xff0c0b0b),
            fontWeight: FontWeight.w400,
            height: 1.5625,
          ),
          textHeightBehavior:
              const TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
        VerticallSpace(1),
        PasswordTextField(
          width: width,
          height: height,
          controller : controller, // ✅ Added controller here
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
