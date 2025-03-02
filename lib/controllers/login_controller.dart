import 'dart:convert';
import 'package:NovaHealth/utils/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:NovaHealth/utils/api_endpoint.dart';

class RegistrationController extends GetxController {
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();


  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.registerEmail
      );

      Map<String, String> body = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
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
          
          emailController.clear();
          passwordController.clear();
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
