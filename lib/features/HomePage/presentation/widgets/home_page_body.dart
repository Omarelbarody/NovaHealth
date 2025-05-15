import 'package:NovaHealth/core/utils/size_config.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:NovaHealth/features/Activities/presentation/widgets/Activities_page_body.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/sign%20up/widgets/sign_up_view.dart';
import 'package:NovaHealth/features/ChatBot/presentation/widgets/chatbot_page_view.dart';
import 'package:NovaHealth/features/Consultaion/presentation/widgets/department_page_body.dart';
import 'package:NovaHealth/features/Consultaion/presentation/widgets/department_page_view.dart';
import 'package:NovaHealth/features/HomePage/presentation/widgets/home_page_view.dart';
import 'package:NovaHealth/features/MedicaNews/presentation/widgets/medical_news_view.dart';
import 'package:NovaHealth/features/ProfilePage/Presentation/widgets/profile_page_body.dart';
import 'package:NovaHealth/features/ProfilePage/Presentation/widgets/profile_page_view.dart';
import 'package:NovaHealth/features/Activities/presentation/widgets/Activities_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeContent(),
    ActivitiesContent(),
    ProfileContent(),
  ];

  // void _onItemTapped(int index) {
  //   if (index == 0) {
  //     // Navigate to HomeView on home icon tap
  //     Get.to(() => const HomeView(), transition: Transition.fade);
  //   }
  //   else if (index == 1) {
  //     // Navigate to ActivitiesPageView on activities icon tap
  //     Get.to(() => const ActivitiesPageView(), transition: Transition.fade);
  //   }
  //   else if (index == 2) {
  //     // Navigate to ProfilePageView on profile icon tap
  //     Get.to(() => const ProfilePageView(), transition: Transition.fade);
  //   }
  //   else {
  //     setState(() {
  //       _selectedIndex = index;
  //     });
  //   }
  // }
//   void _onItemTapped(int index) {
//   setState(() {
//     _selectedIndex = index;
//   });

//   if (index == 0) {
//     Get.to(() => const HomeView(), transition: Transition.fade);
//   } else if (index == 1) {
//     Get.to(() => const ActivitiesPageView(), transition: Transition.fade);
//   } else if (index == 2) {
//     Get.to(() => const ProfilePageView(), transition: Transition.fade);
//   }
// }
void _onItemTapped(int index) {
  if (_selectedIndex == index) return; // Do nothing if already selected

  setState(() {
    _selectedIndex = index;
  });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
            //***********************************************Nova bot************************************************* */

      body: Stack(
  children: [
    _pages[_selectedIndex],
    if (_selectedIndex == 0) // Show FAB only on HomeContent page
      Positioned(
        bottom: 5,
        right: 5,
        child: SizedBox(
          height: 82,
          width: 92,
          child: FloatingActionButton(
            onPressed: () {
                Get.to(() => ChatbotPageView(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 150));
              // Add your AI bot functionality here
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Image.asset(
              'assets/images/Ai bot.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
  ],
),
            //*****************************************Home&Activities&Profile bar************************************** */

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(height: 0.5, thickness: 1),
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 28),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment_outlined, size: 28),
                label: 'Activities',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 28),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
            showUnselectedLabels: true,
            onTap: _onItemTapped,
            // type: BottomNavigationBarType.fixed,
            // elevation: 0,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //***********************************************logo************************************************* */
            VerticallSpace(5),
            Row(
              children: [
                HorizintalSpace(1),
                SizedBox(
                  child: Image.asset('assets/images/logo.png'),
                )
              ],
            ),
            VerticallSpace(2),
            //***********************************************How can we help?************************************************* */

            Row(
              children: [
                HorizintalSpace(3),
                const Text(
                  'How can we help?',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
            //***********************************************consultaion**************************************** */
              
              children: [
                HorizintalSpace(1),
                InkWell(
                  onTap: () {
                    Get.to(() => DepartmentView(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 150));
                  },
                  child: Ink.image(
                    image: const AssetImage('assets/images/consultaion.png'),
                    height: 107,
                    width: 120.33,
                    fit: BoxFit.cover,
                  ),
                ),
                InkWell(
            //***********************************************Laboratory**************************************** */
                  onTap: () {},
                  child: Ink.image(
                    image: const AssetImage('assets/images/Laboratory.png'),
                    height: 107,
                    width: 120.33,
                    fit: BoxFit.cover,
                  ),
                ),
                InkWell(
            //***********************************************Radiology**************************************** */
                  
                  onTap: () {},
                  child: Ink.image(
                    image: const AssetImage('assets/images/Radiology.png'),
                    height: 107,
                    width: 120.33,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            VerticallSpace(1),
            //***********************************************Don't feel right?**************************************** */

            Row(
              children: [
                HorizintalSpace(2),
                const Text(
                  'Don\'t feel right?',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            //***********************************************NovaAi**************************************** */

            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Ink.image(
                          image: const AssetImage('assets/images/NovaAi.png'),
                          height: 98,
                          width: 380,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Image.asset(
                              'assets/images/o3.png',
                              width: 50,
                              height: 100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            VerticallSpace(1),
            //***********************************************Upcoming Appointments**************************************** */

            Row(
              children: [
                HorizintalSpace(2),
                const Text(
                  'Upcoming Appointments',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            VerticallSpace(1),
            //***********************************************Appointment1**************************************** */

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HorizintalSpace(2),
                  InkWell(
                    onTap: () {},
                    child: Ink.image(
                      image: const AssetImage('assets/images/Appointment1.png'),
                      height: 132,
                      width: 218,
                      fit: BoxFit.cover,
                    ),
                  ),
                  HorizintalSpace(2),
                  InkWell(
                    onTap: () {},
                    child: Ink.image(
                      image: const AssetImage('assets/images/Appointment1.png'),
                      height: 132,
                      width: 218,
                      fit: BoxFit.cover,
                    ),
                  ),
                  HorizintalSpace(2),
                ],
              ),
            ),
            VerticallSpace(1),
            //***********************************************Medical News**************************************** */

            Row(
              children: [
                HorizintalSpace(2),
                const Text(
                  'Medical News',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                HorizintalSpace(11),
            //***********************************************See All**************************************** */
                GestureDetector(
                  onTap: () {
                    Get.to(() => MedicalView(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 150));
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 45, 132, 251),
                    ),
                  ),
                ),
              ],
            ),
            VerticallSpace(1),
            //***********************************************news1**************************************** */

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                    Get.to(() => MedicalView(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 150));
                  },
                    child: Ink.image(
                      image: const AssetImage('assets/images/news1.png'),
                      height: 123,
                      width: 359,
                      fit: BoxFit.cover,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                    Get.to(() => MedicalView(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 150));
                  },
                    child: Ink.image(
                      image: const AssetImage('assets/images/news1.png'),
                      height: 123,
                      width: 359,
                      fit: BoxFit.cover,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                    Get.to(() => MedicalView(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 150));
                  },
                    child: Ink.image(
                      image: const AssetImage('assets/images/news1.png'),
                      height: 123,
                      width: 359,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
