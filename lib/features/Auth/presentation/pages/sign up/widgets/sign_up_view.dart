import 'package:NovaHealth/features/Auth/presentation/pages/sign%20up/widgets/sign_up_view_body.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/sign%20up/widgets/signup_view_body_2.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpViewBody2(),
    );
  }
}