import 'package:NovaHealth/core/utils/size_config.dart';
import 'package:NovaHealth/core/widgets/backgroung_color_page.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:NovaHealth/features/Activities/presentation/widgets/Activities_page_body.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/sign%20up/widgets/sign_up_view.dart';
import 'package:NovaHealth/features/Consultaion/presentation/widgets/department_page_view.dart';
import 'package:NovaHealth/features/HomePage/presentation/widgets/home_page_body.dart';
import 'package:NovaHealth/features/HomePage/presentation/widgets/home_page_view.dart';
import 'package:NovaHealth/features/Labs/presentation/widgets/labs_page_view.dart';
import 'package:NovaHealth/features/Prescriptions/presentation/widgets/Prescriptions_page_view.dart';
import 'package:NovaHealth/features/Privacy%20Policy/presentation/widgets/privacy_policy_page_view.dart';
import 'package:NovaHealth/features/Profile%20Data/presentation/widgets/profile_data_view.dart';
import 'package:NovaHealth/features/ProfilePage/Presentation/widgets/profile_page_view.dart';
import 'package:NovaHealth/features/Activities/presentation/widgets/Activities_page_view.dart';
import 'package:NovaHealth/features/Radology/presentation/widgets/Radology_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/login/widgets/login_view.dart';

class ProfilePageBody extends StatefulWidget {
  const ProfilePageBody({super.key});

  @override
  _ProfilePageBodyState createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody> {
  int _selectedIndex = 0;


    static const List<Widget> _pages = <Widget>[
    HomeContent(),
    ActivitiesContent(),
    ProfileContent(),
  ];

void _onItemTapped(int index) {
  if (_selectedIndex == index) return; // Do nothing if already selected

  setState(() {
    _selectedIndex = index;
  });
Get.to(() => const ProfilePageView(), transition: Transition.fade);
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050D2C),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          // Profile photo
          Center(
            child: SizedBox(
              width: 120,
              height: 120,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/ProfilePhoto.png'),
              ),
            ),
          ),
          const SizedBox(height: 7),
          // User name
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( 
                'Omar Elbarody',
                style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
            ]
          ),
          const SizedBox(height: 30),
          // Menu items
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0.5,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _ProfileMenuButton(icon: Icons.person, label: 'Profile'),
                  Divider(height: 1),
                  _ProfileMenuButton(icon: Icons.receipt_long, label: 'Prescriptions'),
                  Divider(height: 1),
                  _ProfileMenuButton(icon: Icons.receipt_long, label: 'Labs'),
                  Divider(height: 1),
                  _ProfileMenuButton(icon: Icons.receipt_long, label: 'Radology'),
                  Divider(height: 1),
                  _ProfileMenuButton(icon: Icons.credit_card, label: 'Payment Method'),
                  Divider(height: 1),
                  _ProfileMenuButton(icon: Icons.lock, label: 'Privacy Policy'),
                  Divider(height: 1),
                  _ProfileMenuButton(icon: Icons.settings, label: 'Settings'),
                  Divider(height: 1),
                  _ProfileMenuButton(icon: Icons.help_outline, label: 'Help'),
                  Divider(height: 1),
                  _ProfileMenuButton(icon: Icons.logout, label: 'Logout'),
                ],
              ),
            ),
          ),
        ],
      ),
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

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF050D2C),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 60),
              // Profile photo
              Center(
                child: SizedBox(
                  width: 160,
                  height: 160,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/ProfilePhoto.png'),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // User name
              const Text(
                'Omar Elbarody',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 35),
              // Menu items
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _ProfileMenuButton(icon: Icons.person, label: 'Profile'),
                    Divider(height: 1),
                    _ProfileMenuButton(icon: Icons.receipt_long, label: 'Prescriptions'),
                    Divider(height: 1),
                    _ProfileMenuButton(icon: Icons.receipt_long, label: 'Labs'),
                    Divider(height: 1),
                    _ProfileMenuButton(icon: Icons.receipt_long, label: 'Radology'),
                    Divider(height: 1),
                    _ProfileMenuButton(icon: Icons.credit_card, label: 'Payment Method'),
                    Divider(height: 1),
                    _ProfileMenuButton(icon: Icons.lock, label: 'Privacy Policy'),
                    Divider(height: 1),
                    _ProfileMenuButton(icon: Icons.settings, label: 'Settings'),
                    Divider(height: 1),
                    _ProfileMenuButton(icon: Icons.help_outline, label: 'Help'),
                    Divider(height: 1),
                    _ProfileMenuButton(icon: Icons.logout, label: 'Logout'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileMenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final double iconSize;

  const _ProfileMenuButton({
    Key? key,
    required this.icon,
    required this.label,
    this.iconSize = 29,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        foregroundColor: Colors.black,
        alignment: Alignment.centerLeft,
      ),
      onPressed: () {
        if (label == 'Logout') {
          Get.to(() => const LoginView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 200));
        }
        if (label == 'Profile') {
          Get.to(() => const ProfileDataView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 200));
        }
          if (label == 'Prescriptions') {
          Get.to(() => const PrescriptionsPageView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 200));
        }
            if (label == 'Labs') {
          Get.to(() => const labsPageView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 200));
        }
              if (label == 'Radology') {
          Get.to(() => const RadologysPageView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 200));
        }
              if (label == 'Privacy Policy') {
          Get.to(() => const PrivacyPageView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 200));
        }
      },
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: iconSize),
          const SizedBox(width: 16),
          Text(
            label,
            style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
