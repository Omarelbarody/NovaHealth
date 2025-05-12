import 'package:NovaHealth/core/utils/size_config.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/sign%20up/widgets/sign_up_view.dart';
import 'package:NovaHealth/features/Consultaion/presentation/widgets/department_page_view.dart';
import 'package:NovaHealth/features/HomePage/presentation/widgets/home_page_view.dart';
import 'package:NovaHealth/features/ProfilePage/Presentation/widgets/profile_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class ProfilePageBody extends StatefulWidget {
  const ProfilePageBody({super.key});

  @override
  _ProfilePageBodyState createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    DepartmentContent(),
    Center(child: Text('Activities Page')),
    Center(child: Text('Profile Page')),
  ];

  void _onItemTapped(int index) {
  switch (index) {
    case 0:
      Get.to(() => const HomeView(), transition: Transition.fade);
      break;
    // case 1:
    //   Get.to(() => const ActivitiesPageView(), transition: Transition.rightToLeft);
    //   break;
    case 2:
      Get.to(() => const ProfilePageView(), transition: Transition.rightToLeft);
      break;
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Activities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
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
            //******************************************* My Profile ***************************************** */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text('My Profile',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    )),
              ],
            ),
            //*******************************************Profile Photo ***************************************** */
            Center(
                  child: Image.asset(
                    'assets/images/ProfilePhoto.png',
                    width: 120,
                    height: 120,
            ),
          ),
            //*******************************************Omar Elbarody ***************************************** */
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                const Text('Omar Elbarody',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ],
            ),
          VerticallSpace(1),
            //*******************************************Profile ***************************************** */
            Row(
              children: [
                HorizintalSpace(3),
              Icon(
                    Icons.person,
                    color: Colors.blue,
                    size: 40, // <-- control icon scale here
                  ),
                HorizintalSpace(2),
                  Row(
              children: [
                const Text('Profile',
                    style: TextStyle(
                      fontFamily: 'League Spartan',
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    )),
              ],
            ),
              ],
            )
            


          ],
        ),
      ),
    );
  }
}
