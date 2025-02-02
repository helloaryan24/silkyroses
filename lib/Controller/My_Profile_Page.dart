import 'package:get/get.dart';
import 'package:flutter/material.dart';

class My_Profile_Controller extends GetxController {
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final mobileNumberController = TextEditingController();

  var email = ''.obs;
  var address = ''.obs;
  var mobileNumber = ''.obs;

  void logout() {
    // Add your logout logic here
    print("User logged out");
  }
}
