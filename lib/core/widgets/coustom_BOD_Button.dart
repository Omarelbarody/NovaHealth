import 'package:flutter/material.dart';

class CoustomBodBoutton extends StatelessWidget {
  final TextInputType? inputType;
  final Widget? suffexIcon;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final int? maxLines;
  final double? width;
  final double? height;
  final String? lableText;
  final TextEditingController? controller;
  final String? Function(dynamic value) validator;
  final bool hasError;
  final InputDecoration? decoration;
  final Icon? icon;

  //final bool obscurerText;
  // ignore: use_super_parameters
  const CoustomBodBoutton({
    Key? key,
    @required this.inputType,
    this.suffexIcon,
    @required this.onSaved,
    this.onChanged,
    this.maxLines,
    this.width,
    this.height,
    this.lableText,
    this.controller,
    required this.validator,
    required this.hasError,
    this.decoration,
    this.icon,
    
    //required this.obscurerText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double calculatedHeight = height ?? 50; // Default height if not set
    double fontSize = calculatedHeight * 0.35; // Scale font size dynamically
    fontSize = fontSize.clamp(12, 20); // Keep font size between 12 and 20
    return SizedBox(
      width: width, // Set width
      height: height, // Set height
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        onChanged: onChanged,
        onSaved: onSaved,
        maxLines: maxLines,
        decoration: InputDecoration(
          icon:Icon(Icons.calendar_today,color: Colors.blue), 
          labelText: lableText,
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Color(0xFFCCCCCC),
              )),
          contentPadding: EdgeInsets.symmetric(
            vertical: calculatedHeight * 0.025, // Adjust padding dynamically
            horizontal: 12,
          ),
        ),
      ),
    );
  }
}
