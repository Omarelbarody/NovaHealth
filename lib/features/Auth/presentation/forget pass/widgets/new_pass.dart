import 'dart:convert';
import 'package:NovaHealth/core/widgets/coustom_buttons.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/login/widgets/complete_information_item.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/login/widgets/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewPass extends StatefulWidget {
 final String phoneNumber;
  const NewPass({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _NewPassState createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  final TextEditingController newPassController = TextEditingController();

  Future<void> resetPassword() async {
    final String url =
        "https://2bc7-197-37-59-62.ngrok-free.app/api/v1/auth/reset-password";
    final Map<String, String> headers = {"Content-Type": "application/json"};

    // Debugging: Print the phone number before making the request
    print("Phone Number Sent to API: ${widget.phoneNumber}");

    if (widget.phoneNumber.isEmpty) {
      Get.snackbar("Error", "Phone number is missing",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    final Map<String, dynamic> body = {
      "phoneNumber": widget.phoneNumber, // Ensure it's passed correctly
      "newPassword": newPassController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        Get.to(() => LoginView(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 150));
      } else {
        Get.snackbar("Error", "Invalid request: ${response.body}",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("Error: $e");
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
              SizedBox(child: Image.asset('assets/images/logo.png')),
            ],
          ),
          VerticallSpace(3),

          // "Enter New Password" Text
          Row(
            children: [
              HorizintalSpace(5),
              const Text('Enter New Password',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
            ],
          ),
          VerticallSpace(7),

          // New Password Input
          CompleteInfoItem(
            width: 350,
            height: 61,
            text: 'New Password',
            inputType: TextInputType.text,
            controller: newPassController,
          ),
          VerticallSpace(7),

          // Submit
          SizedBox(
            width: 350,
            height: 61,
            child: CoustomGeneralButtons(
              text: 'Submit',
              onTap: resetPassword,
            ),
          ),
        ],
      ),
    );
  }
}
