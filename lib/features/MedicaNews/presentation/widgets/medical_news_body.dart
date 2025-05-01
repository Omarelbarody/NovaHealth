import 'package:NovaHealth/core/utils/size_config.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/sign%20up/widgets/sign_up_view.dart';
import 'package:NovaHealth/features/Consultaion/presentation/widgets/department_page_view.dart';
import 'package:NovaHealth/features/HomePage/presentation/widgets/home_page_view.dart';
import 'package:NovaHealth/features/MedicaNews/presentation/widgets/medical_news_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class MedicalBody extends StatefulWidget {
  const MedicalBody({super.key});

  @override
  _MedicalBodyState createState() => _MedicalBodyState();
}

class _MedicalBodyState extends State<MedicalBody> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    MedicalContent(),
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

class MedicalContent extends StatelessWidget {
  const MedicalContent({super.key});

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
            Row(
              children: [
                HorizintalSpace(1),
                SizedBox(
                  child: Image.asset('assets/images/logo.png'),
                )
              ],
            ),
            VerticallSpace(2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Medical News',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            VerticallSpace(1),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HorizintalSpace(2),
                  const Text(
                    'All',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  HorizintalSpace(2),
                  const Text(
                    'Covid 19',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  HorizintalSpace(2),
                  const Text(
                    'Healthy living',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  HorizintalSpace(2),
                  const Text(
                    'Common Diseases',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            VerticallSpace(1),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.asset('assets/images/Healthing living.png'),
                  Image.asset('assets/images/Healthing living.png'),
                ],
              ),
            ),
            VerticallSpace(1),
            Image.asset('assets/images/Healthing living 2.png'),
            Image.asset('assets/images/Covid19.png'),
            Image.asset('assets/images/comon diseases.png'),
            //Image.asset('assets/images/Medical news.png'),
          ],
        ),
      ),
    );
  }
}
