import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../All_Custom_Faction/Image.dart';
import '../Api_Format/All_Url.dart';
import '../Api_Format/Api_services.dart';
import '../All_Custom_Faction/All_Widget.dart';

class SignUpController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final locationController = TextEditingController();

  RxBool policyAccepted = false.obs; // Observable for policy acceptance
  final AllApiFaction apiFaction = AllApiFaction(); // Instance of AllApiFaction

  List<String> countryCodes = ['+91']; // Example country codes
  RxString selectedCountryCode = '+91'.obs; // Default country code
  // final ApiService apiService = ApiService(ApiUrl.baseUrl); // Initialize ApiService with base URL

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailAddressController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    locationController.dispose();
    super.onClose();
  }

  void signup() {
    Get.back(); // Navigate to the previous page
  }

  void signupdone() {
    Get.offAllNamed('/BottomBar_Page'); // Navigate to bottom bar page
  }

  Future<void> register() async {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailAddressController.text.trim();
    String phoneNumber = phoneNumberController.text.trim();
    String location = locationController.text.trim();
    String address = addressController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String fullPhoneNumber = selectedCountryCode.value + phoneNumber;

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        phoneNumber.isEmpty ||
        address.isEmpty ||
        !policyAccepted.isTrue) {
      showEmptyFieldDialog1();
      print('Fields are empty');
    } else if (!EmailValidator.validate(email)) {
      showInvalidEmailDialog();
      print('Invalid email');
    } else if (password.length < 8) {
      showInvalidPasswordLengthDialog1();
      print('Password must be at least 8 characters long');
    } else if (!containsUppercaseLetter(password)) {
      showMissingUppercaseLetterDialog();
      print('Password must contain at least one uppercase letter');
    } else if (!containsSpecialCharacter(password)) {
      showMissingSpecialCharacterDialog();
      print('Password must contain at least one special character');
    } else if (password != confirmPassword) {
      showPasswordMismatchDialog();
      print('Passwords do not match');
    } else if (phoneNumber.length != 10 || !isNumeric(phoneNumber)) {
      showInvalidPhoneNumberDialog();
      print('Phone number must be exactly 10 digits');
    } else {
      await apiFaction.signup(
          firstName,
          lastName,
          email,
          fullPhoneNumber,
          address,
          location,
          password,
          confirmPassword,
          policyAccepted.value // Pass the boolean value
      );
    }
  }
}
