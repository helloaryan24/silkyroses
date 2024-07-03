import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import 'Confirm_Payment_Page.dart';

class Thank_You_Page extends StatelessWidget {
  const Thank_You_Page({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.contcolor2,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(
          backgroundColor: AppColors.contcolor,
          onTap: () {
            Get.offAllNamed('/BottomBar_Page');
          },
          text: 'View order status',
          style: TextStyles.Merribold1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 20),
          child: Column(
            children: [
              Image.asset(
                Images.logoimage,
                width: screenSize.width * 0.5,
              ),
              SizedBox(
                height: 50,
              ),
              lottieAnimation(context, Images.flowersloder),
              SizedBox(
                height: 20,
              ),
              Text(
                "Thank You!",
                style: TextStyles.Merriblack6,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Your order is placed successfully, please go to order page to manage status.",
                style: TextStyles.Merriblack3,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
