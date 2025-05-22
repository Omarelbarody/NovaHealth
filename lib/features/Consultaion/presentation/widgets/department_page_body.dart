import 'package:NovaHealth/core/utils/size_config.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:NovaHealth/features/Activities/presentation/widgets/Activities_page_body.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/sign%20up/widgets/sign_up_view.dart';
import 'package:NovaHealth/features/Consultaion/presentation/widgets/department_page_view.dart';
import 'package:NovaHealth/features/Doctor%20List/presentation/widgets/doctor_list_page_view.dart';
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
  @override
  Widget build(BuildContext context) {
    return const DepartmentContent();
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
                                //*********************************************Cardiology *********************************************/
                InkWell(
                  onTap: () {
                    Get.to(() => const DoctorListPageView(specialty: 'Cardiology'), 
                      transition: Transition.rightToLeft, 
                      duration: const Duration(milliseconds: 200)
                    );
                  },
                  child: Ink.image(
                    image: AssetImage('assets/images/Cardiology.png'),
                    height: 130,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                HorizintalSpace(1),
                                //*******************************************ENT*********************************************** */
                InkWell(
                  onTap: () {
                    Get.to(() => const DoctorListPageView(specialty: 'ENT'), 
                      transition: Transition.rightToLeft, 
                      duration: const Duration(milliseconds: 200)
                    );
                  },
                  child: Ink.image(
                    image: AssetImage('assets/images/ENT.png'),
                    height: 130,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                
                HorizintalSpace(1),
                //*********************************************Dermatology *********************************************/
                InkWell(
                  onTap: () {
                    Get.to(() => const DoctorListPageView(specialty: 'Dermatology'), 
                      transition: Transition.rightToLeft, 
                      duration: const Duration(milliseconds: 200)
                    );
                  },
                  child: Ink.image(
                    image: AssetImage('assets/images/Dermatology.png'),
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
                  onTap: () {
                    Get.to(() => const DoctorListPageView(specialty: 'Internal Medicine'), 
                      transition: Transition.rightToLeft, 
                      duration: const Duration(milliseconds: 200)
                    );
                  },
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
                  onTap: () {
                    Get.to(() => const DoctorListPageView(specialty: 'Dental'), 
                      transition: Transition.rightToLeft, 
                      duration: const Duration(milliseconds: 200)
                    );
                  },
                  child: Ink.image(
                    image: AssetImage('assets/images/Dental.png'),
                    height: 130,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                  HorizintalSpace(1),
                              //*********************************************Orthopedic *********************************************/
                InkWell(
                  onTap: () {
                    Get.to(() => const DoctorListPageView(specialty: 'Orthopedic'), 
                      transition: Transition.rightToLeft, 
                      duration: const Duration(milliseconds: 200)
                    );
                  },
                  child: Ink.image(
                    image: AssetImage('assets/images/Orthopedic.png'),
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
