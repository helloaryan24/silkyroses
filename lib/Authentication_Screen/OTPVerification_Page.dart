import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/OTPVerification_Controller.dart';
import 'Authentication_Widget/Authentication_Widget.dart';

class OTPVerification_Page extends StatelessWidget {
  final OTPVerificationController otpVerificationController =
  Get.put(OTPVerificationController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Images.signupbg),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Verification Code', style: TextStyles.Merribold2),
                SizedBox(height: 10),
                Text('We have send the verification code to your email address', style: TextStyles.MerriLight),
                SizedBox(height: 20),
                buildInputField(
                  hintText: 'OTP',
                  controller: otpVerificationController.otpController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 50),
                CustomButton(
                  backgroundColor: AppColors.contcolor,
                  onTap: () {
                    otpVerificationController.verifyOTP();
                  },
                  text: 'Verify OTP',
                  style: TextStyles.Merribold1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
