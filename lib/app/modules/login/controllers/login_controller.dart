import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milestone_4/app/modules/home/views/home_view.dart';
import 'package:milestone_4/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void login() {
    final String email = emailController.text;
    final String password = passwordController.text;

    // Perform your login logic here, for simplicity using shared preferences
    if (email == "test@example.com" && password == "password") {
      // Save login status to shared preferences
      // Redirect to main page
      Get.toNamed(Routes.HOME);
    } else {
      // Show error message
      Get.snackbar('Login Failed', 'Invalid email or password');
    }
  }
}
