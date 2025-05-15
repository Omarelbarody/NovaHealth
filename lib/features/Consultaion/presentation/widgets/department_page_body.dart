import 'package:NovaHealth/core/utils/size_config.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:NovaHealth/features/Activities/presentation/widgets/Activities_page_body.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/sign%20up/widgets/sign_up_view.dart';
import 'package:NovaHealth/features/Consultaion/presentation/widgets/department_page_view.dart';
import 'package:NovaHealth/features/HomePage/presentation/widgets/home_page_body.dart';
import 'package:NovaHealth/features/HomePage/presentation/widgets/home_page_view.dart';
import 'package:NovaHealth/features/ProfilePage/Presentation/widgets/profile_page_body.dart';
import 'package:NovaHealth/features/ProfilePage/Presentation/widgets/profile_page_view.dart';
import 'package:NovaHealth/features/Activities/presentation/widgets/activities_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class DepartmentBody extends StatefulWidget {
  const DepartmentBody({super.key});

  @override
  _DepartmentBodyState createState() => _DepartmentBodyState();
}

class _DepartmentBodyState extends State<DepartmentBody> {
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

  // if (index == 0) {
  //   Get.to(() => const HomeView(), transition: Transition.fade);
  // } else if (index == 1) {
  //   Get.to(() => const ActivitiesPageView(), transition: Transition.fade);
  // } else if (index == 2) {
  //   Get.to(() => const ProfilePageView(), transition: Transition.fade);
  // }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: _pages[_selectedIndex],
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
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
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

class DepartmentContent extends StatelessWidget {
  const DepartmentContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          VerticallSpace(5),
            //************************************************logo*************************************************** */
            Row(
              children: [
                HorizintalSpace(1),
                SizedBox(
                  child: Image.asset('assets/images/logo.png'),
                )
              ],
            ),
        VerticallSpace(2),
            //*******************************************Choose the Department. ***************************************** */
            Row(
              children: [
                HorizintalSpace(1),
                const Text('Choose the Department.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ],
            ),
            Row(
              children: [
                HorizintalSpace(1),
                //*********************************************Orthopedic *********************************************/
                InkWell(
                  onTap: () {},
                  child: Ink.image(
                    image: AssetImage('assets/images/Orthopedic.png'),
                    height: 130,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                HorizintalSpace(1),
                //*********************************************Dermatology *********************************************/
                InkWell(
                  onTap: () {},
                  child: Ink.image(
                    image: AssetImage('assets/images/Dermatology.png'),
                    height: 130,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                HorizintalSpace(1),
                //*******************************************ENT*********************************************** */
                InkWell(
                  onTap: () {},
                  child: Ink.image(
                    image: AssetImage('assets/images/ENT.png'),
                    height: 130,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                HorizintalSpace(1),
              
              ],
            ),
            Row(
              children: [
                HorizintalSpace(1),
                  //*******************************************InternalMedicine*********************************************** */
                  InkWell(
                  onTap: () {},
                  child: Ink.image(
                    image: AssetImage('assets/images/InternalMedicine.png'),
                    height: 130,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                HorizintalSpace(1),
                //*********************************************Dental *********************************************/
                InkWell(
                  onTap: () {},
                  child: Ink.image(
                    image: AssetImage('assets/images/Dental.png'),
                    height: 130,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                  HorizintalSpace(1),
                //*********************************************Cardiology *********************************************/
                InkWell(
                  onTap: () {},
                  child: Ink.image(
                    image: AssetImage('assets/images/Cardiology.png'),
                    height: 130,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
              
              

            )


          ],
        ),
      ),
    );
  }
}
