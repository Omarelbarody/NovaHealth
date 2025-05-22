import 'package:flutter/material.dart';
import 'package:NovaHealth/features/Doctor%20List/presentation/widgets/doctor_list_page_body.dart';

class DoctorListPageView extends StatelessWidget {
  final String specialty;

  const DoctorListPageView({
    Key? key,
    required this.specialty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: doctorListPageBody(specialty: specialty),
    );
  }
}