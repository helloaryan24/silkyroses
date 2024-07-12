import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Authentication_Screen/Authentication_Widget/Authentication_Widget.dart';
import '../Controller/Profile_Controller.dart';
import '../Inside_Page/My_Order_Page.dart';
import '../Inside_Page/My_profile_Page.dart';
import '../ZoomDrawer/MenuScreen.dart';

class Profile_Page extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.contcolor2,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: customAppbarhomescreen(context),
                  ),
                  SizedBox(height: 10),
                  CustomButton2(
                    backgroundColor: AppColors.whitecolor,
                    onTap: () {
                      Get.to(() => My_Profile_Page());
                    },
                    text: 'My Profile',
                    style: TextStyles.MontserratBold6,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    backgroundColor: AppColors.whitecolor,
                    onTap: () {
                      Get.to(() => My_Order_Page());
                    },
                    text: 'My Order',
                    style: TextStyles.MontserratBold6,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    backgroundColor: AppColors.whitecolor,
                    onTap: () {
                      // Add Help logic here
                    },
                    text: 'Save Roses',
                    style: TextStyles.MontserratBold6,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    backgroundColor: AppColors.whitecolor,
                    onTap: () {
                      // Add Help logic here
                    },
                    text: 'Help',
                    style: TextStyles.MontserratBold6,
                  ),
                  SizedBox(height: 20),
                  CustomButton2(
                    backgroundColor: AppColors.whitecolor,
                    onTap: () {
                      Get.offAllNamed('/');
                      // Add Delete account logic here
                    },
                    text: 'Delete account',
                    style: TextStyles.MontserratBold6,
                  ),
                  SizedBox(height: 70),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      backgroundColor: AppColors.contcolor,
                      onTap: () {
                        Get.offAllNamed('/');
                        // Add Log out logic here
                      },
                      text: 'Log out',
                      style: TextStyles.MontserratBold12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }

  Widget buildLabelText(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyles.Merriblack7,
      ),
    );
  }
}
