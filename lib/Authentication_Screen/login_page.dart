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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Images.loginbg),
              fit: BoxFit.cover,

            ),
          ),
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Images.logoimage,
                    width: 180,

                ),
                SizedBox(height: 70),
               Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Log in', style: TextStyles.MontserratBold)),
                SizedBox(height: 20),
                buildInputField(
                  hintText: 'Email address',
                  controller: loginController.emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
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
                      loginController.forgetpassword();
                    },
                    child: Text('Forgot your Password?', style: TextStyles.MontserratBold1),
                  ),
                ),
                SizedBox(height: 40),
                CustomButton5(
                  backgroundColor: AppColors.contcolor4,
                  onTap: () {
                    loginController.loginIn();
                  },
                  text: 'Log in',
                  style: TextStyles.MontserratMedium1,
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

                CustomButton5(
                  backgroundColor: AppColors.contcolor4,
                  onTap: () {
                    loginController.signindone();
                  },
                  text: 'Continue as a guest',
                  style: TextStyles.MontserratMedium1,
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    loginController.signup();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account ? ', style: TextStyles.MontserratMedium2,
                      ),
                      Text('Sign up',
                        style: TextStyles.MontserratBold2,
                      ),
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
