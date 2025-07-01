import 'package:NovaHealth/core/utils/size_config.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/sign%20up/widgets/sign_up_view.dart';
import 'package:NovaHealth/features/HomePage/presentation/widgets/home_page_body.dart';
import 'package:NovaHealth/features/HomePage/presentation/widgets/home_page_view.dart';
import 'package:NovaHealth/features/ProfilePage/Presentation/widgets/profile_page_body.dart';
import 'package:NovaHealth/features/ProfilePage/Presentation/widgets/profile_page_view.dart';
import 'package:NovaHealth/features/Activities/presentation/widgets/activities_page_view.dart';
import 'package:NovaHealth/features/HomePage/data/models/appointment_model.dart';
import 'package:NovaHealth/features/Activities/data/models/queue_status_model.dart';
import 'package:NovaHealth/services/appointment_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class ActivitiesPageBody extends StatefulWidget {
  const ActivitiesPageBody({super.key});

  @override
  _ActivitiesPageBodyState createState() => _ActivitiesPageBodyState();
}

class _ActivitiesPageBodyState extends State<ActivitiesPageBody> {
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

class ActivitiesContent extends StatefulWidget {
  const ActivitiesContent({super.key});

  @override
  State<ActivitiesContent> createState() => _ActivitiesContentState();
}

class _ActivitiesContentState extends State<ActivitiesContent> {
  List<AppointmentModel> _appointments = [];
  Map<int, QueueStatusModel> _queueStatuses = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAppointments();
  }

  Future<void> _loadAppointments() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final appointments = await AppointmentService.getUpcomingAppointments();
      setState(() {
        _appointments = appointments;
      });
      
      // Load queue status for each appointment
      for (var appointment in appointments) {
        _fetchQueueStatus(appointment.appointmentId);
      }
    } catch (e) {
      _showErrorSnackbar('Failed to load appointments');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _fetchQueueStatus(int appointmentId) async {
    try {
      final queueStatusData = await AppointmentService.getQueueStatus(appointmentId);
      final queueStatus = QueueStatusModel.fromJson(queueStatusData);
      
      setState(() {
        _queueStatuses[appointmentId] = queueStatus;
      });
      
      // Check if it's user's turn
      if (queueStatus.yourTurnNumber == queueStatus.currentTurn) {
        _showTurnNotification(appointmentId);
      }
    } catch (e) {
      print('Error fetching queue status: $e');
    }
  }

  void _showTurnNotification(int appointmentId) {
    final appointment = _appointments.firstWhere(
      (a) => a.appointmentId == appointmentId,
      orElse: () => AppointmentModel(
        appointmentId: 0,
        doctorId: 0,
        doctorName: 'Unknown',
        specialty: 'Unknown',
        date: '',
        time: '',
        fee: '',
      ),
    );
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('It\'s Your Turn!'),
        content: Text('Your appointment with Dr. ${appointment.doctorName} is ready now.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _cancelAppointment(appointmentId);
            },
            child: Text('Cancel Appointment', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Future<void> _cancelAppointment(int appointmentId) async {
    try {
      await AppointmentService.cancelAppointment(appointmentId);
      _showSuccessSnackbar('Appointment cancelled successfully');
      _loadAppointments(); // Refresh the list
    } catch (e) {
      _showErrorSnackbar('Failed to cancel appointment');
    }
  }

  void _showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            Text(
              'Your Appointments',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            VerticallSpace(2),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : _appointments.isEmpty
                    ? Center(
                        child: Text(
                          'No upcoming appointments',
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _appointments.length,
                        itemBuilder: (context, index) {
                          final appointment = _appointments[index];
                          final queueStatus = _queueStatuses[appointment.appointmentId];
                          
                          return Card(
                            elevation: 4,
                            margin: EdgeInsets.only(bottom: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: appointment.doctorImageUrl != null
                                            ? NetworkImage(appointment.doctorImageUrl!)
                                            : AssetImage('assets/images/ProfilePhoto.png') as ImageProvider,
                                        radius: 30,
                                      ),
                                      SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Dr. ${appointment.doctorName}',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              appointment.specialty,
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              '${appointment.date} | ${appointment.time}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(height: 24),
                                  if (queueStatus != null) ...[
                                    _buildQueueInfo(queueStatus),
                                    SizedBox(height: 16),
                                  ],
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () => _cancelAppointment(appointment.appointmentId),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text('Cancel Appointment'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
          ],
        ),
      ),
    );
  }

  Widget _buildQueueInfo(QueueStatusModel queueStatus) {
    final isYourTurn = queueStatus.yourTurnNumber == queueStatus.currentTurn;
    final statusColor = isYourTurn ? Colors.green : Colors.blue;
    
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: statusColor.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isYourTurn ? 'It\'s Your Turn Now!' : 'Queue Status',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: statusColor,
            ),
          ),
          SizedBox(height: 8),
          _buildQueueInfoRow('Your Turn Number', '${queueStatus.yourTurnNumber}'),
          _buildQueueInfoRow('Current Turn', '${queueStatus.currentTurn}'),
          _buildQueueInfoRow('Patients Before You', '${queueStatus.patientsBeforeYou}'),
          _buildQueueInfoRow('Status', queueStatus.status.toUpperCase()),
        ],
      ),
    );
  }

  Widget _buildQueueInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
