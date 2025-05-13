import 'package:flutter/material.dart';

class DepartmentPageBody extends StatefulWidget {
  // ... (existing code)
}

class _DepartmentPageBodyState extends State<DepartmentPageBody> {
  // ... (existing code)

  @override
  Widget build(BuildContext context) {
    // ... (existing code)

    return Scaffold(
      // ... (existing code)

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
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
} 