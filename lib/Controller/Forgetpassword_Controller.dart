import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Authentication_Screen/Authentication_Widget/Authentication_Widget.dart';


class ForgetpasswordController extends GetxController {

  final emailController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  void sendOTP() {
    String email = emailController.text.trim();

    if (email.isEmpty || !GetUtils.isEmail(email)) {
      showInvalidEmailDialog();
      print('Invalid email');
    } else {
      // Implement OTP sending logic here
      Get.toNamed('/OTPVerification_Page'); // Navigate to bottom bar page

      print('Sending OTP to $email');
    }
  }

  void showInvalidEmailDialog() {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        contentPadding: EdgeInsets.all(0),
        content: AlertDialogBox(
          message: 'Please enter a valid email address!',
        ),
      ),
    );
  }
}