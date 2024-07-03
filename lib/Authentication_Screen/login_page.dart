import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart'; // Ensure this import is here

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/Login_Controller.dart';
import 'Authentication_Widget/Authentication_Widget.dart';

// Define the lottieAnimation function

class Login_Page extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

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
              image: AssetImage(Images.loginbg),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Images.logoimage,
                  width: 200,
                  // height: 200,
                ),
                SizedBox(height: 70),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Log in', style: TextStyles.Merribold2)),
                SizedBox(height: 20),
                buildInputField(
                  hintText: 'Email address',
                  controller: loginController.emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                InputFieldPassword(
                  hintText: 'Password',
                  controller: loginController.passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // loginController.forgetpassword();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Forgot your ', style: TextStyles.MerriLight),
                        Text('Password? Click here',
                            style: TextStyles.Merribold3),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                CustomButton5(
                  backgroundColor: AppColors.contcolor4,
                  onTap: () {
                    loginController.loginIn();
                  },
                  text: 'Log in',
                  style: TextStyles.Merribold1,
                ),
                SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                  child: buildDividerText('Continue with'),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildSocialLoginButton(
                      Images.logogoogle,
                      () {
                        // Handle onTap logic here
                        print(' button tapped');
                      },
                    ),
                    buildSocialLoginButton(
                      Images.logoapple,
                      () {
                        // Handle onTap logic here
                        print(' button tapped');
                      },
                    ),
                    buildSocialLoginButton(
                      Images.logofacebook,
                      () {
                        // Handle onTap logic here
                        print(' button tapped');
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
                // Align(
                //     alignment: Alignment.center,
                //     child: Text('OR', style: TextStyles.MerriLight1)),
                // SizedBox(height: 15),
                // CustomButton1(
                //   backgroundColor: AppColors.contcolor1,
                //   onTap: () {
                //     loginController.signindone();
                //
                //     // Handle continue as guest logic
                //   },
                //   text: 'Continue as a guest',
                //   style: TextStyles.Merribold4,
                // ),
                CustomButton5(
                  backgroundColor: AppColors.contcolor4,
                  onTap: () {
                    loginController.signindone();
                  },
                  text: 'Continue as a guest',
                  style: TextStyles.Merribold1,
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    loginController.signup();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have ', style: TextStyles.MerriLight),
                      Text('an account ? Sign up',
                          style: TextStyles.Merribold3),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
