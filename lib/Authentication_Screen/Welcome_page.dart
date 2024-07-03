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

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whitecolor,
        body: Obx (()=>Container(
          width: screenSize.width,
          height: screenSize.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Images.logoimage,
                  width: 200,
                ),
                Container(
                  height: 600,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Images.welcomebg2),
                          fit: BoxFit.fill)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30,top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedOpacity(
                              opacity:
                                  welcomeController.showWelcomeText.value ? 1.0 : 0.0,
                              duration: Duration(seconds: 1),
                              child: Text(
                                'Welcome to',
                                style: TextStyles.Merribold,
                              ),
                            ),
                            SizedBox(height: 5,),
                            AnimatedOpacity(
                              opacity: welcomeController.showJoinUsText.value ? 1.0 : 0.0,
                              duration: Duration(seconds: 1),
                              child: Text(
                                'Join us',
                                style: TextStyles.MerriLight5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50,),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right: 150),
                          child: AnimatedOpacity(
                            opacity:
                                welcomeController.showContinueButton.value ? 1.0 : 0.0,
                            duration: Duration(seconds: 1),
                            child: CustomButton5(
                              backgroundColor: AppColors.contcolor4,
                              onTap: () {
                                welcomeController.continuee();
                              },
                              text: 'Continue',
                              style: TextStyles.Merribold1,
                            ),
                          ),
                        ),
                        // SizedBox(height: 50,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
