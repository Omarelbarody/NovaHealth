import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, ThemeData, Widget, WidgetsFlutterBinding, runApp;
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:NovaHealth/features/splash/presentation/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const NovaHealth());
}

class NovaHealth extends StatelessWidget {
  static final String title = 'Set Background Color';
  const NovaHealth({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
