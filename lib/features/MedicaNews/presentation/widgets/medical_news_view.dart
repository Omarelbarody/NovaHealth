import 'package:NovaHealth/features/MedicaNews/presentation/widgets/medical_news_body.dart';
import 'package:flutter/material.dart';

class MedicalView extends StatelessWidget {
  const MedicalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MedicalBody(),
    ) ;
  }
}