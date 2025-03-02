import 'package:flutter/material.dart';
import 'package:NovaHealth/features/splash/presentation/widgets/spalsh_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      body: SpalshViewBody(),

    );
  }
}