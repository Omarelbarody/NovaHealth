import 'package:NovaHealth/features/Doctor List/widgets/doctor_list_page_body.dart';
import 'package:flutter/material.dart';

class doctorListPageView extends StatelessWidget {
  const doctorListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: doctorListPageBody(),
    );
  }
}