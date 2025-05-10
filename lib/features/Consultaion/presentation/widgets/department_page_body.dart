import 'package:NovaHealth/core/utils/size_config.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/sign%20up/widgets/sign_up_view.dart';
import 'package:NovaHealth/features/Consultaion/presentation/widgets/department_page_view.dart';
import 'package:NovaHealth/features/HomePage/presentation/widgets/home_page_view.dart';
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
    DepartmentContent(),
    Center(child: Text('Activities Page')),
    Center(child: Text('Profile Page')),
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      // Navigate to HomeView on home icon tap
      Get.to(() => const HomeView(), transition: Transition.fade);
    } else {
      setState(() {
        _selectedIndex = index;
      });
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
