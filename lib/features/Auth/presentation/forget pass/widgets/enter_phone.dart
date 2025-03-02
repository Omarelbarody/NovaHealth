import 'dart:convert';
import 'package:NovaHealth/core/widgets/coustom_buttons.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:NovaHealth/features/Auth/presentation/forget%20pass/widgets/otp.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/login/widgets/complete_information_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EnterPhone extends StatefulWidget {
  const EnterPhone({Key? key}) : super(key: key);

  @override
  _EnterPhoneState createState() => _EnterPhoneState();
}

class _EnterPhoneState extends State<EnterPhone> {
  final TextEditingController phoneNumberController = TextEditingController();

  Future<void> forgetPass() async {
    final String url = "https://2bc7-197-37-59-62.ngrok-free.app/api/v1/auth/forget-password";
    final Map<String, String> headers = {"Content-Type": "application/json"};
    final Map<String, String> body = {
      "phoneNumber": phoneNumberController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        // Navigate to OTP Verification Page with phoneNumber
        Get.to(() => OTPVerificationPage(phoneNumber: phoneNumberController.text),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 150));
      } else {
        Get.snackbar("Error", "Invalid Phone number",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to connect to server",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          VerticallSpace(4),

          // Logo
          Row(
            children: [
              //HorizintalSpace(1),
              SizedBox(child: Image.asset('assets/images/logo.png')),
            ],
          ),
          VerticallSpace(3),

          // "Enter your phone number" Text
          Row(
            children: [
              HorizintalSpace(5),
              const Text('Enter your phone number',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
            ],
          ),
          VerticallSpace(7),

          // Phone Number Input
          CompleteInfoItem(
            width: 350,
            height: 61,
            text: 'Phone number',
            inputType: TextInputType.phone,
            controller: phoneNumberController,
          ),
          VerticallSpace(7),

          // Send SMS Button
          SizedBox(
            width: 350,
            height: 61,
            child: CoustomGeneralButtons(
              text: 'Send SMS',
              onTap: forgetPass,
            ),
          ),
        ],
      ),
    );
  }
}
