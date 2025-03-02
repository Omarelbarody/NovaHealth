import 'dart:convert';
import 'package:NovaHealth/core/widgets/coustom_buttons.dart';
import 'package:NovaHealth/core/widgets/space_widget.dart';
import 'package:NovaHealth/features/Auth/presentation/forget%20pass/widgets/new_pass.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/login/widgets/complete_information_item.dart';
import 'package:NovaHealth/features/Auth/presentation/pages/login/widgets/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OTPVerificationPage extends StatefulWidget {
  final String phoneNumber;
  
  const OTPVerificationPage({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final TextEditingController otpController = TextEditingController();
  //final TextEditingController phoneNumberController = TextEditingController();


  Future<void> verifyOtp() async {
    final String url =
        "https://2bc7-197-37-59-62.ngrok-free.app/api/v1/auth/verify-otp";
    final Map<String, String> headers = {"Content-Type": "application/json"};
    final Map<String, String> body = {
      "phoneNumber": widget.phoneNumber,
      "otp": otpController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Get.to(() => NewPass(phoneNumber: widget.phoneNumber),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 150));
      } else {
        Get.snackbar("Error","Invalid OTP",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to connect to server",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //********************************************Resend************************************************************** */
  Future<void> resendOtp() async {
    final String url =
        "https://2bc7-197-37-59-62.ngrok-free.app/api/v1/auth/resend-otp";
    final Map<String, String> headers = {"Content-Type": "application/json"};
    final Map<String, String> body = {
      "phoneNumber": widget.phoneNumber,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Get.snackbar("Success", "OTP resent successfully!",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Error","Wait a minute to make a resend ",
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
          VerticallSpace(2),

          // "Enter OTP" Text
          Row(
            children: [
              HorizintalSpace(1),
              const Text('Enter OTP Code',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
            ],
          ),
          //We sent an OTP code to
          Row(
            children: [
              HorizintalSpace(2),
              Text("We sent an OTP code to ${widget.phoneNumber}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          // Phone Number Info

          VerticallSpace(6),

          // OTP Input Field
          CompleteInfoItem(
            width: 350,
            height: 61,
            text: 'OTP Code',
            inputType: TextInputType.number,
            controller: otpController,
          ),
          VerticallSpace(6),

          // Verify Button
          SizedBox(
            width: 350,
            height: 61,
            child: CoustomGeneralButtons(
              text: 'Verify OTP',
              onTap: verifyOtp,
            ),
          ),
          Row(
            children: [
              HorizintalSpace(3),
              Text("Didin't recive the code?",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
              TextButton(
                onPressed: resendOtp,
                child: const Text("Resend Code"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
