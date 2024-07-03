import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../Authentication_Screen/Authentication_Widget/Authentication_Widget.dart';
import '../Controller/Products_Controller.dart';
import '../Controller/Search_page_Controller.dart';
import 'Colors.dart';
import 'Image.dart';
import 'TextStyle.dart';

class CustomButton5 extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onTap;
  final TextStyle style;

  const CustomButton5({
    required this.text,
    required this.backgroundColor,
    required this.onTap,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            // border: Border.all(width: 2,color: Colors.black),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: style,
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onTap;
  final TextStyle style;

  const CustomButton({
    required this.text,
    required this.backgroundColor,
    required this.onTap,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: style,
          ),
        ),
      ),
    );
  }
}

class CustomButton1 extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onTap;
  final TextStyle style;

  const CustomButton1({
    required this.text,
    required this.backgroundColor,
    required this.onTap,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.yellow,
            period: Duration(seconds: 2),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: style,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onTap;
  final TextStyle style;

  const CustomButton2({
    required this.text,
    required this.backgroundColor,
    required this.onTap,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.contcolor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: style,
            ),
            Icon(
              Icons.arrow_forward,
              color: AppColors.contcolor,
            )
          ],
        ),
      ),
    );
  }
}
class CustomButton3 extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onTap;
  final TextStyle style;

  const CustomButton3({
    required this.text,
    required this.backgroundColor,
    required this.onTap,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: style,
        ),
      ),
    );
  }
}
class CustomButton4 extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onTap;
  final TextStyle style;

  const CustomButton4({
    required this.text,
    required this.backgroundColor,
    required this.onTap,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(width: 2,color: AppColors.contcolor)
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: style,
        ),
      ),
    );
  }
}


class SuffixIconWidget extends StatelessWidget {
  final ProductsController controller = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Obx(
            () => AvatarGlow(
              animate: controller.isListening.value,
              glowColor: Colors.red,
              endRadius: 25.0,
              duration: Duration(milliseconds: 1000),
              repeatPauseDuration: Duration(milliseconds: 500),
              repeat: true,
              child: InkWell(
                onTap: controller.listen,
                child: Image.asset(
                  Images.imgmic,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigate to filter page
              Get.toNamed('/Filter_Page'); // Navigate to filter page
            },
            child: Image.asset(
              Images.imgfilter,
              fit: BoxFit.fill,
              height: 18,
              width: 18,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

class SuffixIconWidget1 extends StatelessWidget {
  final Search_Controller controller = Get.find<Search_Controller>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Obx(
            () => AvatarGlow(
              animate: controller.isListening.value,
              glowColor: Colors.red,
              endRadius: 25.0,
              duration: Duration(milliseconds: 1000),
              repeatPauseDuration: Duration(milliseconds: 500),
              repeat: true,
              child: InkWell(
                onTap: controller.listen,
                child: Image.asset(
                  Images.imgmic,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigate to filter page
              Get.toNamed('/Filter_Page'); // Navigate to filter page
            },
            child: Image.asset(
              Images.imgfilter,
              fit: BoxFit.fill,
              height: 18,
              width: 18,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

Widget lottieAnimation(BuildContext context, String url) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: AppColors.contcolor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Lottie.asset(
            alignment: Alignment.center,
            // height: 300,
            // width: 300,
            animate: true,
            reverse: true,

            url,
            // Lottie.asset('assets/LottieLogo1.json'),

            // onLoaded: (composition) {
            //   Future.delayed(composition.duration, () {
            //     Navigator.of(context).pop();
            //   });
            // },
          ),
        ),
      ),
    ),
  );
}

class CustomAppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            Images.backimage,
            height: 40,
            width: 40,
          ),
        ),
        Image.asset(
          Images.logoimage,
          width: screenSize.width * 0.5,
        ),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            Images.cencelimage,
            height: 40,
            width: 40,
          ),
        ),
      ],
    );
  }
}
Widget customAppbarhomescreen(BuildContext context,) {
  final screenSize = MediaQuery.of(context).size;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 40,
        width: 40,
      ),
      Image.asset(
        Images.logoimage,
        width: screenSize.width * 0.5,
      ),
      Container(
        height: 40,
        width: 40,
      ),
    ],
  );
}
void showInvalidFormatDialog() {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: EdgeInsets.all(0),
      content: AlertDialogBox(
        message: 'Invalid email or phone number format!',
      ),
    ),
  );
}

bool containsUppercaseLetter(String str) {
  // Check if the password contains at least one uppercase letter
  return str.contains(RegExp(r'[A-Z]'));
}

bool containsSpecialCharacter(String str) {
  // Check if the password contains at least one special character
  return str.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
}

bool isNumeric(String str) {
  // Check if the string consists only of numeric characters
  return double.tryParse(str) != null;
}

void showEmptyFieldDialog() {
  // Implement your dialog to show that fields are empty

  AlertDialog(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    contentPadding: EdgeInsets.all(0),
    content: AlertDialogBox(
      message: 'Fields are empty',
    ),
  );
}

void showInvalidPasswordLengthDialog() {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: EdgeInsets.all(0),
      content: AlertDialogBox(
        message: 'Password must be more than 8 characters long!',
      ),
    ),
  );
}

void showEmptyFieldDialog1() {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: EdgeInsets.all(0),
      content: AlertDialogBox(
        message: 'All fields are required!',
      ),
    ),
  );
}

void showInvalidEmailDialog() {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: EdgeInsets.all(0),
      content: AlertDialogBox(
        message: 'Please enter a valid email address!',
      ),
    ),
  );
}

void showInvalidPasswordLengthDialog1() {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: EdgeInsets.all(0),
      content: AlertDialogBox(
        message: 'Password must be at least 8 characters long!',
      ),
    ),
  );
}

void showMissingUppercaseLetterDialog() {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: EdgeInsets.all(0),
      content: AlertDialogBox(
        message: 'Password must contain at least one uppercase letter!',
      ),
    ),
  );
}

void showMissingSpecialCharacterDialog() {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: EdgeInsets.all(0),
      content: AlertDialogBox(
        message: 'Password must contain at least one special character!',
      ),
    ),
  );
}

void showPasswordMismatchDialog() {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: EdgeInsets.all(0),
      content: AlertDialogBox(
        message: 'Passwords do not match!',
      ),
    ),
  );
}

void showInvalidPhoneNumberDialog() {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: EdgeInsets.all(0),
      content: AlertDialogBox(
        message: 'Phone number must be exactly 10 digits!',
      ),
    ),
  );
}

void showLoading() {
  Get.dialog(
    WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ),
        ),
      ),
    ),
  );
}

void closeLoading() {
  Get.back();
}

void showSuccessSnackbar(String msg,
    {SnackPosition? position,
    Color iconColor = Colors.red,
    IconData icon = Icons.error,
    Color containerColor = Colors.red}) {
  Get.closeAllSnackbars();
  Get.snackbar(
    '',
    '',
    messageText: Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: iconColor,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    msg,
                    style: TextStyles.Merriblack3,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            width: double.infinity,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
          )
        ],
      ),
    ),
    titleText: const SizedBox.shrink(),
    snackPosition: position ?? SnackPosition.BOTTOM,
    backgroundColor: Colors.white,
    colorText: Colors.white,
    borderRadius: 5,
    margin: const EdgeInsets.all(10),
    padding: EdgeInsets.all(0),
    dismissDirection: DismissDirection.horizontal,
    boxShadows: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 1,
        spreadRadius: 1,
        offset: Offset(0, 0),
      ),
    ],
  );
}

showErrorSnackbar(String msg, {SnackPosition? position}) {
  Get.closeAllSnackbars();
  Get.snackbar(
    '',
    '',
    messageText: Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(msg, style: TextStyles.Merriblack3),
    ),
    titleText: const SizedBox.shrink(),
    snackPosition: position ?? SnackPosition.BOTTOM,
    backgroundColor: Colors.red[900],
    dismissDirection: DismissDirection.horizontal,
    margin: const EdgeInsets.all(20),
  );
}
