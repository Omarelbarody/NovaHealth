import 'package:NovaHealth/features/Labs/presentation/widgets/labs_page_body.dart';
import 'package:flutter/material.dart';

class labsPageView extends StatelessWidget {
  const labsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: labsPageBody(),
    );
  }
}