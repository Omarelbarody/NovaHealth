import 'package:NovaHealth/core/widgets/coustom_text_field.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

class CompleteInfoItem extends StatefulWidget {
  const CompleteInfoItem({
    Key? key,
    required this.text,
    this.inputType,
    this.maxLines,
    this.width,
    this.height,
    required this.controller,
  }) : super(key: key);

  final String text;
  final TextInputType? inputType;
  final int? maxLines;
  final double? width;
  final double? height;
  final TextEditingController controller;

  @override
  _CompleteInfoItemState createState() => _CompleteInfoItemState();
}

class _CompleteInfoItemState extends State<CompleteInfoItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Color(0xff0c0b0b),
            fontWeight: FontWeight.w400,
            height: 1.5625,
          ),
          textAlign: TextAlign.center,
        ),
        VerticallSpace(1),
        CoustomTextField(
          controller: widget.controller,
          inputType: widget.inputType,
          maxLines: widget.maxLines,
          width: widget.width,
          height: widget.height,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          hasError: false,
        ),
      ],
    );
  }
}
