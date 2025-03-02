import 'dart:convert';
import 'package:NovaHealth/core/widgets/coustom_BOD_Button.dart';
import 'package:NovaHealth/core/widgets/coustom_text_field.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/login/widgets/complete_information_item_pass_2.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/login/widgets/login_view.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/login/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:NovaHealth/core/utils/size_config.dart';
import 'package:NovaHealth/core/widgets/coustom_buttons.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/login/widgets/complete_information_item.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/login/widgets/complete_information_item_pass.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/sign%20up/widgets/sign_up_view.dart';
import 'package:NovaHealth/features/on%20Bording/presentation/on_bordin_view.dart';

class SignUpViewBody2 extends StatefulWidget {
  const SignUpViewBody2({super.key});

  @override
  _SignUpViewBody2State createState() => _SignUpViewBody2State();
}

class _SignUpViewBody2State extends State<SignUpViewBody2> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  bool _hasError = false;

  Future<void> signup() async {
    final String url = "https://2bc7-197-37-59-62.ngrok-free.app/api/v1/auth/signup";
    final Map<String, String> headers = {"Content-Type": "application/json"};
    final Map<String, String> body = {
      "fullName": fullNameController.text,
      "address": addressController.text,
      "city": cityController.text,
      "phoneNumber": phoneNumberController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "dob": dobController.text,
      "gender": genderController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Get.to(() => LoginViewBody(),
            transition: Transition.rightToLeft,
            duration: Duration(milliseconds: 150));
      } else {
        Get.snackbar("Error", "Invalid login credentials",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to connect to server",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
    Widget  buildLabel(String text) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        children: const [
          TextSpan(
            text: ' *',
            style: TextStyle(
                color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(1900); // The earliest possible date
    DateTime lastDate = DateTime.now(); // The latest possible date

    // Show Date Picker and get the selected date
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null && pickedDate != initialDate) {
      setState(() {
        // Format the date into a string and update the controller
        dobController.text =
            "${pickedDate.toLocal()}".split(' ')[0]; // Display as yyyy-mm-dd
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Prevents resizing when keyboard appears
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: [
          VerticallSpace(5),

          // *************************************************Logo*************************************************//
          Row(
            children: [
              HorizintalSpace(1),
              SizedBox(child: Image.asset('assets/images/logo.png')),
            ],
          ),
          VerticallSpace(1),

          // ********************************"Please Identify Yourself" Text*************************************//
          Row(
            children: [
              HorizintalSpace(2),
              const Text('Please Identify Yourself',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ],
          ),
          VerticallSpace(1),

          // ***************************************"All fields are required." Text**********************************//
          Row(
            children: [
              HorizintalSpace(2),
              const Text('All fields are required.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  )),
            ],
          ),
          VerticallSpace(2),

          // **************************************Full name**********************************************//
          Row(
            children: [
              HorizintalSpace(2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLabel("Full Name"),
                  CoustomTextField(
                    width: 350,
                    height: 45,
                    controller: fullNameController,
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                    inputType: TextInputType.text, // Provide input type
                    onSaved:
                        (value) {}, // Provide an empty function or actual logic
                    hasError: _hasError, // Make sure _hasError is declared
                  ),
                ],
              ),
            ],
          ),
          VerticallSpace(2),

          // ***************************************Address & City******************************************//
          Row(
            children: [
              HorizintalSpace(2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLabel("Address"),
                  CoustomTextField(
                    width: 230,
                    height: 45,
                    maxLines: 2,
                    controller: addressController,
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                    inputType: TextInputType.text, // Provide input type
                    onSaved:
                        (value) {}, // Provide an empty function or actual logic
                    hasError: _hasError, // Make sure _hasError is declared
                  ),
                ],
              ),
              HorizintalSpace(2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLabel("City"),
                  CoustomTextField(
                    width: 100,
                    height: 45,
                    inputType: TextInputType.text,
                    controller: cityController,
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                    onSaved:
                        (value) {}, // Provide an empty function or actual logic
                    hasError: _hasError, // Make sure _hasError is declared
                  ),
                ],
              ),
            ],
          ),
          VerticallSpace(2),

          //**************************************************** Phone Number******************************************//
          Row(
            children: [
              HorizintalSpace(2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLabel("Phone Number"),
                  CoustomTextField(
                    width: 350,
                    height: 45,
                    inputType: TextInputType.phone,
                    controller: phoneNumberController,
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                    onSaved:
                        (value) {}, // Provide an empty function or actual logic
                    hasError: _hasError, // Make sure _hasError is declared
                  ),
                ],
              ),
            ],
          ),
          VerticallSpace(2),

          //*************************************************** Email********************************************//
          Row(
            children: [
              HorizintalSpace(2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLabel("Email"),
                  CoustomTextField(
                    width: 350,
                    height: 45,
                    controller: emailController,
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                    inputType: TextInputType.text, // Provide input type
                    onSaved:
                        (value) {}, // Provide an empty function or actual logic
                    hasError: _hasError, // Make sure _hasError is declared
                  ),
                ],
              ),
            ],
          ),
          VerticallSpace(2),

          // *************************************************Password******************************************//
          Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //buildLabel("Password"),
                  HorizintalSpace(2),
                  CompleteInfoItemPass2(
                    width: 350,
                    height: 45,
                    text: 'Password',
                    
                    controller: passwordController,
                  ),
                ],
              ),
          // Row(
          //   children: [
          //     HorizintalSpace(2),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         buildLabel("Password"),
          //         CoustomTextField(
          //           width: 350,
          //           height: 45,
          //           controller: _passwordController,
          //           validator: (value) => value!.isEmpty ? 'Required' : null,
          //           inputType: TextInputType.text, // Provide input type
          //           onSaved:
          //               (value) {}, // Provide an empty function or actual logic
          //           hasError: _hasError, // Make sure _hasError is declared
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          VerticallSpace(2),

          //****************************************** Date of Birth & Gender**************************************//
          Row(
            children: [
              HorizintalSpace(2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLabel("Date of Birth"),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: AbsorbPointer(
                      child: CoustomBodBoutton(
                        width: 200,
                        height: 50,
                        controller: dobController,
                        validator: (value) =>
                            value!.isEmpty ? 'Required' : null,
                        inputType: TextInputType.text,
                        hasError: _hasError,
                        onSaved: (value) {},
                      ),
                    ),
                  ),
                ],
              ),
//***********************************************Gender****************************************************//
              HorizintalSpace(4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLabel("Gender"),
                  CoustomTextField(
                    width: 100,
                    height: 45,
                    controller: genderController,
                    validator: (value) => value!.isEmpty ? 'Required' : null,
                    inputType: TextInputType.text, // Provide input type
                    onSaved:
                        (value) {}, // Provide an empty function or actual logic
                    hasError: _hasError, // Make sure _hasError is declared
                  ),
                ],
              ),
            ],
          ),
          VerticallSpace(4),
          // **********************************************Next Button*********************************************//
          Row(
            children: [
              HorizintalSpace(28),
              SizedBox(
                width: 100,
                height: 45,
                child: CoustomGeneralButtons(
                  text: 'Next',
                  onTap: signup,
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
