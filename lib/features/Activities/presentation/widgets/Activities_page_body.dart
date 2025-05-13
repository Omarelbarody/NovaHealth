import 'package:flutter/material.dart';

class ActivitiesPageBody extends StatelessWidget {
  const ActivitiesPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activities'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Activities Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}