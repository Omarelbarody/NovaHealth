import 'package:NovaHealth/features/HomePage/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:HomeViewBody() ,
    );
  }
}