import 'dart:async';

import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final FormFieldSetter<String>? onSaved;  // Change to FormFieldSetter
  final ValueChanged<String>? onChanged;   // Use ValueChanged
  final double? width;
  final double? height;
  final TextEditingController? controller;
  const PasswordTextField({
    Key? key,
    this.onSaved,
    this.onChanged,
    this.width,
    this.height,
   this.controller,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscure = true; // 👀 Controls visibility

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        onChanged: widget.onChanged,
        onSaved: widget.onSaved, // Now it's correctly typed
        obscureText: _isObscure, // Hide text input
        controller:  widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off, //Toggle
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure; // 🔄 Toggle visibility
              });
            },
          ),
        ),
      ),
    );
  }
}
