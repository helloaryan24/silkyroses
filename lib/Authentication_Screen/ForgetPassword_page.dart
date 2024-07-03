import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/Forgetpassword_Controller.dart';
import 'Authentication_Widget/Authentication_Widget.dart';

class Forgetpassword_Page extends StatelessWidget {
  final ForgetpasswordController forgetPasswordController =
      Get.put(ForgetpasswordController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.contcolor1,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: (){
Get.back();
            },
              child: Image.asset(
            Images.backimage,
            height: 10,
            width: 10,
          )),
        ),
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
                Text('Email', style: TextStyles.Merribold2),
                SizedBox(height: 20),
                buildInputField(
                  hintText: 'Email address',
                  controller: forgetPasswordController.emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 50),
                CustomButton(
                  backgroundColor: AppColors.contcolor,
                  onTap: () {
                    forgetPasswordController.sendOTP();
                  },
                  text: 'Send OTP',
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
