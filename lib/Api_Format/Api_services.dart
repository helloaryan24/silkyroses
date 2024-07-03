import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../All_Custom_Faction/All_Widget.dart';
import '../Models/User_Models1.dart';
import 'All_Url.dart';

class AllApiFaction extends GetxController {


  Future<void> signin(String email, String password) async {
  showLoading();
  try {
    final String signInUrl = ApiUrls.loginapi;
    final signInResponse = await http.post(
      Uri.parse(signInUrl),
      body: {
        'email': email,
        'password': password,
      },
    );
    final jsonResponse = jsonDecode(signInResponse.body);
    final success = jsonResponse['success'];
    if (success == true) {
      final userData = jsonResponse['data'];
      // final UserModel user = UserModel.fromJson(userData);

      // Save token using TokenManager
      // await TokenManager.saveToken(user.token);

      closeLoading();
      final message = jsonResponse['message'];
      showSuccessSnackbar(
        message,
        icon: Icons.check_circle,
        iconColor: Colors.green,
        containerColor: Colors.green,
      );

      // Navigate to the main screen after successful login
      Get.offAllNamed('/BottomBar_Page');
    } else {
      closeLoading();
      final message = jsonResponse['message'];
      showSuccessSnackbar(
        message,
        icon: Icons.error_outline,
        iconColor: Colors.red,
        containerColor: Colors.red,
      );
    }
  } catch (e) {
    closeLoading();
    showSuccessSnackbar(
      'An error occurred while processing your request',
      icon: Icons.error_outline,
      iconColor: Colors.red,
      containerColor: Colors.red,
    );
    print('Exception occurred: $e');
  }
}

  Future<void> signup(
      String firstName,
      String lastName,
      String email,
      String fullPhoneNumber,
      String address,
      String locationController,
      String password,
      String confirmationpassword,
      bool policyAccepted,
      ) async {
    print('First Name: $firstName');
    print('Last Name: $lastName');
    print('Email: $email');
    print('Phone Number: $fullPhoneNumber');
    print('Address: $address');
    print('Password: $password');
    print('Location: $locationController');
    print('Policy Accepted: $policyAccepted');

    try {
      final String signInUrl = ApiUrls.register;
      final http.Response signInResponse = await http.post(
        Uri.parse(signInUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'phone_number': fullPhoneNumber,
          'address': address,
          'location': locationController,
          'password': password,
          'password_confirmation': confirmationpassword,
          'terms_and_conditions': policyAccepted,
        }),
      );

      final jsonResponse = jsonDecode(signInResponse.body);
      final int statusCode = signInResponse.statusCode;

      if (statusCode == 201) {
        final bool success = jsonResponse['success'];

        if (success) {
          final userData = jsonResponse['data'];
          final message = jsonResponse['message'];

          // Parse response data into UserModel1
          // final UserModel1 user = UserModel1.fromJson(userData);
          //
          // // Print some properties for debugging
          // print('Message: $message');
          // print('Success: $success');
          // print('User ID: ${user.id}');
          // print('Username: ${user.username}');
          // print('Email: ${user.email}');
          // print('Is Email Verified: ${user.isEmailVerified}');
          // print('Version: ${user.v}');

          // Example: Show success snackbar
          showSuccessSnackbar(
            message,
            icon: Icons.check_circle,
            iconColor: Colors.green,
            containerColor: Colors.green,
          );

          // Example: Navigate to another screen on success
          Get.offAllNamed('/BottomBar_Page');
        } else {
          final message = jsonResponse['message'];

          // Show error snackbar
          showSuccessSnackbar(
            message,
            icon: Icons.error_outline,
            iconColor: Colors.red,
            containerColor: Colors.red,
          );
        }
      } else {
        // Handle non-200 status code errors
        final message = jsonResponse['message'];
        print(jsonResponse['message']);
        showSuccessSnackbar(
          '${jsonResponse['message']}',
          icon: Icons.error_outline,
          iconColor: Colors.red,
          containerColor: Colors.red,
        );
        // showSuccessSnackbar(
        //   'HTTP Error $statusCode: ${signInResponse.reasonPhrase}',
        //   icon: Icons.error_outline,
        //   iconColor: Colors.red,
        //   containerColor: Colors.red,
        // );
        print('HTTP Error $statusCode: ${signInResponse.reasonPhrase}');
      }
    } catch (e) {
      // Handle exceptions
      showSuccessSnackbar(
        'Exception occurred: $e',
        icon: Icons.error_outline,
        iconColor: Colors.red,
        containerColor: Colors.red,
      );
      print('Exception occurred: $e');
    }
  }
}
