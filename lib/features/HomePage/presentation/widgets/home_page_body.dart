import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:flutter/material.dart';

class HomeViewBody  extends StatelessWidget {
  const HomeViewBody ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
      reverse: true,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //******************************************Logo************************************************** */
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
              //***************************************How can we help?************************************************8 */
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
              //VerticallSpace(1),
              //*****************************************consultaion Button********************************************* */
              Row(
                children: [
                  HorizintalSpace(1),
                  InkWell(
                    onTap: () {},
                    child: Ink.image(
                    image:AssetImage('assets/images/consultaion.png'),
                      height: 107,
                      width: 120.33,
                      fit: BoxFit.cover,
                    ),
                  ),
              //*****************************************Laboratory Button********************************************* */
                  
                  InkWell(
                    onTap: () {},
                    child: Ink.image(
                      image:AssetImage('assets/images/Laboratory.png'),
                      height: 107,
                      width: 120.33,
                      fit: BoxFit.cover,
                    ),
                  ),
              //*****************************************Radiology Button**************************************** */
                    
                  InkWell(
                    onTap: () {},
                    child: Ink.image(
                      image:AssetImage('assets/images/Radiology.png'),
                      height: 107,
                      width: 120.33,
                      fit: BoxFit.cover,
                    ),
                  ),
              ],),
              VerticallSpace(1),
              //*****************************************Don't Feel right?**************************************** */
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

              //*****************************************NovaAi Button**************************************** */
            Row(children: [
              //HorizintalSpace(1),
              InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8), // Optional for rounded edges
                    child: Stack(
                      alignment: Alignment.centerRight, // Aligns the overlay image to the right
                      children: [
                        Ink.image(
                          image: AssetImage('assets/images/NovaAi.png'),
                          height: 98,
                          width: 380,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.centerRight, // Moves 'o3.png' to the right inside the button
                          child: Padding(
                            padding: EdgeInsets.only(right: 20), // Adjust right padding as needed
                            child: Image.asset(
                              'assets/images/o3.png',
                              width: 50, // Adjust size as needed
                              height: 100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )

                
              

              ],)



          ],
        ),

      ),





    ),
    );
  }
}