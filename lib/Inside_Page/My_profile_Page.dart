import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Authentication_Screen/Authentication_Widget/Authentication_Widget.dart';
import '../Controller/My_Profile_Page.dart';

class My_Profile_Page extends StatelessWidget {
  final My_Profile_Controller MyProfileController =
      Get.put(My_Profile_Controller());

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(CupertinoIcons.back),
                    ),
                    Image.asset(
                      Images.logoimage,
                      width: screenSize.width * 0.5,
                    ),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.contcolor5.withOpacity(0.9),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.contcolor5.withOpacity(0.5),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                      'https://shotkit.com/wp-content/uploads/bb-plugin/cache/cool-profile-pic-matheus-ferrero-landscape-6cbeea07ce870fc53bedd94909941a4b-zybravgx2q47.jpeg',
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildLabelText('First Name'),
                    buildLabelText('Last Name'),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: buildInputField(
                        hintText: 'First Name',
                        controller: MyProfileController.emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: buildInputField(
                        hintText: 'Last Name',
                        controller: MyProfileController.emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                buildLabelText('Mobile Number'),
                SizedBox(height: 5),
                buildNumberInputField(
                  hintText: 'Mobile Number',
                  controller: MyProfileController.emailController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  context: context,
                ),
                SizedBox(height: 10),
                buildLabelText('Email'),
                SizedBox(height: 5),
                buildInputField(
                  hintText: 'Email',
                  controller: MyProfileController.addressController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 10),
                buildLabelText('Address'),
                SizedBox(height: 5),
                buildInputField(
                  hintText: 'Address',
                  controller: MyProfileController.mobileNumberController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 50),
                CustomButton5(
                  backgroundColor: AppColors.contcolor,
                  onTap: () {
                    Get.offAllNamed('/');
                    // Add checkout logic here
                  },
                  text: 'Update',
                  style: TextStyles.MontserratMedium1,
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
        style: TextStyles.MontserratBold1,
      ),
    );
  }
}
