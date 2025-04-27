import 'package:NovaHealth/core/utils/size_config.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/sign%20up/widgets/sign_up_view.dart';
import 'package:NovaHealth/features/Consultaion/presentation/widgets/department_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
    Center(child: Text('Activities Page')),
    Center(child: Text('Profile Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: EdgeInsets.all(5),
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
            //*******************************************How can we help?***************************************** */
            Row(
              children: [
                HorizintalSpace(3),
                const Text('How can we help?',
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
                //*********************************************consultaion *********************************************/
                InkWell(
                  onTap: () {
                      Get.to(() => DepartmentView(),
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 150));
                    },
                  child: Ink.image(
                    image: AssetImage('assets/images/consultaion.png'),
                    height: 107,
                    width: 120.33,
                    fit: BoxFit.cover,
                  ),
                ),
                //*********************************************Laboratory *********************************************/
                InkWell(
                  onTap: () {},
                  child: Ink.image(
                    image: AssetImage('assets/images/Laboratory.png'),
                    height: 107,
                    width: 120.33,
                    fit: BoxFit.cover,
                  ),
                ),
                //*******************************************Radiology*********************************************** */
                InkWell(
                  onTap: () {},
                  child: Ink.image(
                    image: AssetImage('assets/images/Radiology.png'),
                    height: 107,
                    width: 120.33,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            VerticallSpace(1),
                //*******************************************Don’t feel right?****************************************** */
            Row(
              children: [
                HorizintalSpace(2),
                const Text('Don’t feel right?',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ],
            ),
                //*******************************************NovaAi****************************************** */

            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(8), // Optional for rounded edges
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Ink.image(
                          image: AssetImage('assets/images/NovaAi.png'),
                          height: 98,
                          width: 380,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 20),
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
            //****************************************Upcoming Appointments***************************************** */
            VerticallSpace(1),
                    Row(
              children: [
                HorizintalSpace(2),
                const Text('Upcoming Appointments',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ],
            ),
              VerticallSpace(1),
          //****************************************Appointment1 Image***************************************** */
              SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HorizintalSpace(2),
              InkWell(
                onTap: () {},
                child: Ink.image(
                  image: AssetImage('assets/images/Appointment1.png'),
                  height: 132,
                  width: 218,
                  fit: BoxFit.cover,
                ),
              ),
              HorizintalSpace(2),
          InkWell(
                onTap: () {},
                child: Ink.image(
                  image: AssetImage('assets/images/Appointment1.png'),
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
            //****************************************Medical News******************************************************* */
            
                    Row(
              children: [
                HorizintalSpace(2),
                const Text('Medical News',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                    HorizintalSpace(11),
            //****************************************See All******************************************************* */
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SignUpView(),///////////////////عدل هناااااااا 
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 150));
                    },
                    child: Text(
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
              SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              //HorizintalSpace(2),
              InkWell(
                onTap: () {},
                child: Ink.image(
                  image: AssetImage('assets/images/news1.png'),
                  height: 123,
                  width: 359,
                  fit: BoxFit.cover,
                ),
              ),
              //HorizintalSpace(1),
              InkWell(
                onTap: () {},
                child: Ink.image(
                  image: AssetImage('assets/images/news1.png'),
                  height: 123,
                  width: 359,
                  fit: BoxFit.cover,
                ),
              ),
              //HorizintalSpace(1),
              InkWell(
                onTap: () {},
                child: Ink.image(
                  image: AssetImage('assets/images/news1.png'),
                height: 123,
                width: 359,
                  fit: BoxFit.cover,
                ),
              ),
              //HorizintalSpace(1),  
            ],
          ),
        ),
          //  VerticallSpace(12),
            //****************************************Ai bot******************************************************* */
            Row(
              children: [
                HorizintalSpace(30),
                InkWell(
                  onTap: () {},
                  child: Ink.image(
                    image: AssetImage('assets/images/Ai bot.png'),
                    height: 82,
                    width: 92,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
