import 'package:NovaHealth/features/Activities/presentation/widgets/Activities_page_body.dart';
import 'package:flutter/material.dart';

class ActivitiesPageView extends StatelessWidget {
  const ActivitiesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ActivitiesPageBody(),
    );
  }
}