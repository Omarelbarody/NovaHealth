import 'dart:convert';
import 'package:NovaHealth/features/Auth/presentation/forget%20pass/widgets/enter_phone.dart';
import 'package:NovaHealth/features/HomePage/presentation/widgets/home_page_body.dart';
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
import 'package:NovaHealth/utils/api_endpoint.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  _LoginViewBodyState createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final String url = ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login;
    final Map<String, String> headers = {"Content-Type": "application/json"};
    final Map<String, String> body = {
      "phone_number": phoneController.text,
      "password": passwordController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Get.to(() => HomeViewBody(),
            transition: Transition.rightToLeft,
            duration: Duration(milliseconds: 150));
      } else { 
        Get.to(() => HomeViewBody(),
            transition: Transition.rightToLeft,
            duration: Duration(milliseconds: 150));
        // Get.snackbar("Error", "Invalid login credentials",
        //     snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to connect to server",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.all(5),
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
              VerticallSpace(1),
              Row(
                children: [
                  HorizintalSpace(2),
                  const Text('Sign in to access your account',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ],
              ),
              VerticallSpace(2),
              Row(
                children: [
                  HorizintalSpace(2),
                  CompleteInfoItem(
                    width: 350,
                    height: 61,
                    text: 'Phone number',
                    inputType: TextInputType.phone,
                    controller: phoneController,
                  ),
                ],
              ),
              VerticallSpace(2),
              Row(
                children: [
                  HorizintalSpace(2),
                  CompleteInfoItemPass(
                    width: 350,
                    height: 61,
                    text: 'Password',
                    controller: passwordController,
                  ),
                ],
              ),
              Row(
                children: [
                  HorizintalSpace(22),
                  TextButton(
                    onPressed: () {
                      Get.to(() => EnterPhone(),
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 150));
                    },
                    child: Text(
                      'Forget password ?',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  HorizintalSpace(1.5),
                  SizedBox(
                    width: 350,
                    height: 61,
                    child: CoustomGeneralButtons(
                      text: 'Sign in',
                      onTap: login,
                    ),
                  ),
                ],
              ),
              VerticallSpace(2),
              Row(
                children: [
                  HorizintalSpace(1),
                  Image.asset('assets/images/OR.png'),
                ],
              ),
              VerticallSpace(3),
              Row(
                children: [
                  HorizintalSpace(7),
                  const Text("Don't have an account?",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 140, 140, 140),
                      )),
                  HorizintalSpace(0.5),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SignUpView(),
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 150));
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 45, 132, 251),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
