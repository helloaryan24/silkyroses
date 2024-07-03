import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../Api_Format/All_Url.dart';
import '../Api_Format/Api_services.dart';
import '../Authentication_Screen/Authentication_Widget/Authentication_Widget.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AllApiFaction apiFaction = AllApiFaction(); // Instance of AllApiFaction

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signup() {
    Get.toNamed('/Signup_Page'); // Navigate to signup page
  }

  void forgetpassword() {
    Get.toNamed('/Forgetpassword_Page'); // Navigate to forget password page
  }

  void signindone() {
    Get.offAllNamed('/BottomBar_Page'); // Navigate to bottom bar page
  }

  Future<void> loginIn() async {
    String emailOrPhone = emailController.text.trim();
    String password = passwordController.text.trim();

    if (emailOrPhone.isEmpty || password.isEmpty) {
      showEmptyFieldDialog1();
      print('Fields are empty');
      return;
    }

    if (!EmailValidator.validate(emailOrPhone) &&
        !(isNumeric(emailOrPhone) && emailOrPhone.length == 10)) {
      showInvalidFormatDialog();
      print('Invalid format');
      return;
    }

    if (password.length < 8) {
      showInvalidPasswordLengthDialog1();
      print('Password must be more than 8 characters long');
      return;
    }

    if (!_isStrongPassword(password)) {
      showMissingSpecialCharacterDialog();
      print(
          'Password must contain at least one uppercase letter and one special character');
      return;
    }

    print(EmailValidator.validate(emailOrPhone)
        ? 'Valid email format'
        : 'Valid phone number format');

    await apiFaction.signin(
        emailOrPhone, password); // Call signin on the instance
  }

  bool _isStrongPassword(String password) {
    // Check if password meets strong criteria: at least one uppercase letter and one special character
    RegExp upperCase = RegExp(r'[A-Z]');
    RegExp specialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    return upperCase.hasMatch(password) && specialChar.hasMatch(password);
  }
}
