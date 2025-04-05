import 'package:NovaHealth/features/Consultaion/presentation/widgets/department_page_body.dart';
import 'package:flutter/material.dart';

class DepartmentView extends StatelessWidget {
  const DepartmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DepartmentBody(),
    );
  }
}