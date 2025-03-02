import 'package:NovaHealth/core/utils/size_config.dart';
import 'package:NovaHealth/core/widgets/coustom_buttons.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/login/widgets/login_view.dart';
import 'package:NovaHealth/features/on%20Bording/presentation/wiggets/coustom_indicator.dart';
import 'package:NovaHealth/features/on%20Bording/presentation/wiggets/coustom_page_view.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class OnBordingViewBody extends StatefulWidget {
  const OnBordingViewBody({super.key});

  @override
  State<OnBordingViewBody> createState() => _OnBordingViewBodyState();
}

class _OnBordingViewBodyState extends State<OnBordingViewBody> {
  PageController? pageController;
  @override
  void initState() {
//*******************************************Call page controller*****************************************************// 
    pageController = PageController (
    initialPage: 0
    )..addListener((){
      setState(() {
        
      });
    });
    super.initState();
  }
//*********************************************dotIndex**************************************************************//
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CoustomPageView(
        pageController: pageController,
      ),
      Positioned(
  left: 0,
  right: 0,
  bottom: SizeConfig.defaultSize! * 17,
  child: CoustomIndicator(
    dotIndex: pageController!.hasClients ? pageController!.page?.round() ?? 0 : 0,
  ),
),

//*********************************************Skip button*************************************************************//
Visibility(
  visible: !(pageController?.hasClients == true && pageController?.page?.round() == 2),
  child: Positioned(
    top: SizeConfig.defaultSize! * 5, // Move to the bottom
    right: 12,
    child: TextButton(
      onPressed: () {
        // Navigate to the main screen or skip the onboarding process
        Get.to(() => LoginView(), transition: Transition.rightToLeft , duration: Duration(milliseconds: 150)); // Example: Jump to the last page
      },
      child: Text(
        'Skip',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 13, // Slightly bigger for better visibility
          fontWeight: FontWeight.normal,
          color: Colors.black, // Change color to indicate it's a button
        ),
      ),
    ),
  ),
),
//************************************** Next & Get Started Button*******************************************************//
      Positioned(
        left: SizeConfig.defaultSize! * 10,
        right: SizeConfig.defaultSize! * 10,
        bottom: SizeConfig.defaultSize! * 5,
        child: SizedBox(
            width: 300, // Adjust width
            height: 56, // Adjust height
            child: CoustomGeneralButtons(
              onTap: () {
                if (pageController!.page! < 2) {
                  pageController?.nextPage(
                      duration: Duration(milliseconds: 150),
                      curve: Curves.easeIn);
                } 
                else {
                  Get.to(() => LoginView(), transition: Transition.rightToLeft , duration: Duration(milliseconds: 150));
                  
                }
                  if (pageController?.hasClients == true) {
    if (pageController?.page?.round() == 2) {
      // Instant action for "Get Started"
      print("Navigating to the main screen");
      // Add navigation code here if needed
    } else {
      // Jump to the next page instantly without animation
      pageController!.jumpToPage(
        (pageController!.page!.toInt() + 1), // Move to the next page immediately
      );
    }
  }
                
              },
              text: pageController?.hasClients == true && pageController?.page?.round() == 2? 'Get Started' : 'Next',
)),
),
  ]);
  }
}
