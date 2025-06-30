import 'package:NovaHealth/features/Privacy%20Policy/presentation/widgets/privacy_policy_body.dart';
import 'package:flutter/material.dart';

class PrivacyPageView extends StatelessWidget {
  const PrivacyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const PrivacyPageBody(),
    );
  }
}