import 'package:NovaHealth/features/Radology/presentation/widgets/Radology_page_body.dart';
import 'package:flutter/material.dart';

class RadologysPageView extends StatelessWidget {
  const RadologysPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RadologyBody(),
    );
  }
}