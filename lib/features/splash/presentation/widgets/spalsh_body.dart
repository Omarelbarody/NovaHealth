import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:NovaHealth/core/utils/size_config.dart';
import 'package:NovaHealth/features/on%20Bording/presentation/on_bordin_view.dart';

class SpalshViewBody extends StatefulWidget {
  const SpalshViewBody({super.key});

  @override
  State<SpalshViewBody> createState() => _SpalshViewBodyState();
}

class _SpalshViewBodyState extends State<SpalshViewBody> {
  get animationController => null;

  @override
  void initState() {
    super.initState();
    goToNextView();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
//************************************** Nova Photo Spalsh_View*******************************************************//

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(children: [
      Spacer(),
    Center(
  child: Image.asset(
    'assets/images/splash_view_image.png',
    width: 300,
    height: 300,
  ),
),
//************************************** Nona Health text Spalsh_View*******************************************************//
      ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [Color(0xff0D92F4), Color(0xff000B58)], // Your two colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(bounds);
        },
        child: const Text('Nova Health',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white, // This must be set to white for ShaderMask to work
            )),
      ),
      Spacer(),
    ]);
  }
//************************************** Go to On_boarding_view************************************************************//
  void goToNextView() {
    Future.delayed(
        Duration(
          seconds: 1,
        ), () {
      Get.to(() => OnBordingView(), transition: Transition.fade);
    });
  }
}
