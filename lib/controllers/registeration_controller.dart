import 'dart:convert';
import 'package:NovaHealth/utils/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:NovaHealth/utils/api_endpoint.dart';

class RegistrationController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  RxString gender = 'Male'.obs; // Using RxString for gender selection

  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail
      );

      Map<String, String> body = {
        'fullName': fullNameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text,
        'phoneNumber': phoneNumberController.text,
        'dob': dobController.text,
        'city': cityController.text,
        'address': addressController.text,
        'gender': gender.value
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print("Token received: $token");

          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);

          // Clear text fields
          fullNameController.clear();
          emailController.clear();
          passwordController.clear();
          phoneNumberController.clear();
          dobController.clear();
          cityController.clear();
          addressController.clear();
          gender.value = 'Male';

          // Navigate to home
          Get.offAllNamed('/home');
        } else {
          throw json['Message'] ?? "Unknown error occurred";
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown error occurred";
      }
    } catch (e) {
      print("Error in registerWithEmail: $e");
    }
  }
}
