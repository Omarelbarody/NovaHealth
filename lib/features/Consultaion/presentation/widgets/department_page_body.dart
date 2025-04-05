import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

class DepartmentBody extends StatelessWidget {
  const DepartmentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(reverse: true,
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









      ],)
    )
    
    
    
    );
  }
}