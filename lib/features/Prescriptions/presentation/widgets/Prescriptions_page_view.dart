import 'package:NovaHealth/features/Prescriptions/presentation/widgets/Prescriptions_page_body.dart';
import 'package:flutter/material.dart';

class PrescriptionsPageView extends StatelessWidget {
  const PrescriptionsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrescriptionsPageBody(),
    );
  }
}