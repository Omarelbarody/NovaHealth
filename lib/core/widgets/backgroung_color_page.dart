import 'package:NovaHealth/main.dart';
import 'package:flutter/material.dart';

class BackgroungColorPage extends StatelessWidget {
  const BackgroungColorPage({super.key});

  @override
  
Widget build (BuildContext context) => Scaffold (
    backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          title: Text(NovaHealth.title),
          centerTitle: true,
        ), // AppBar
        body: Center (child: FlutterLogo (size: 200)), ); // Scaffold
}