import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPVerificationController extends GetxController {
  final otpController = TextEditingController();

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }

  void verifyOTP() {
    String otp = otpController.text.trim();

    // Simulate OTP verification logic (you can replace this with actual logic)
    if (otp == '123456') {
      // OTP is correct, proceed to next screen or action
      Get.snackbar('Success', 'OTP verified successfully!',
          snackPosition: SnackPosition.BOTTOM);
      // Implement navigation to next screen or action here
      print('OTP verified');
    } else {
      // OTP is incorrect, show error message
      Get.snackbar('Error', 'Invalid OTP entered!',
          snackPosition: SnackPosition.BOTTOM);
      print('Invalid OTP');
    }
  }
}
