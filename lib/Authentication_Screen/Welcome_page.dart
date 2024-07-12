import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/Size.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/Welcome_controller.dart';

class Welcome_Page extends StatelessWidget {
  final WelcomeController welcomeController = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context);

    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      body:  Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.welcomebg4),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.topCenter,
        child:Obx(() =>  Padding(
          padding: const EdgeInsets.only(top: 100),
          child: AnimatedScale(
            scale: welcomeController.showLogo.value ? 1.0 : 0.0,
            duration: Duration(seconds: 1),
            child: Image.asset(
              Images.logoimage,
              width: 200,
            ),
          ),
        )),
      ),
    );
  }
}
