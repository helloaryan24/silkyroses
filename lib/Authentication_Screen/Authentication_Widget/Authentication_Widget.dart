import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/main.dart';

import '../../All_Custom_Faction/Colors.dart';
import '../../All_Custom_Faction/TextStyle.dart';

Widget buildInputField({
  required String hintText,
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  bool obscureText = false,
  TextInputAction? textInputAction,
  FocusNode? focusNode,
  FocusNode? nextFocusNode,

}) {
  return SizedBox(
    height: 45,
    width: double.infinity,
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: AppColors.blackcolor,
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontFamily: 'MontserratMedium',
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whitecolor,
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 13,
          fontFamily: 'MontserratRegular',
        ),
        contentPadding: EdgeInsets.all(8),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkgreycolor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkgreycolor.withOpacity(0.5),
          ),
          // borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
  );
}

Widget buildNumberInputField({
  required BuildContext context,

  required String hintText,
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  bool obscureText = false,
  int? maxLength, // Add maxLength parameter
  TextInputAction? textInputAction,
  FocusNode? focusNode,
  FocusNode? nextFocusNode, // Add nextFocusNode to handle focus traversal
}) {
  return SizedBox(
    height: 45,
    width: double.infinity,
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: AppColors.blackcolor,
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontFamily: 'MontserratMedium',
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whitecolor,
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 13,
          fontFamily: 'MontserratRegular',
        ),
        contentPadding: EdgeInsets.all(8),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkgreycolor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.darkgreycolor.withOpacity(0.5),
          ),
          // borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      inputFormatters: maxLength != null && keyboardType == TextInputType.number
        ? [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(maxLength)]
        : null,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      // maxLength: maxLength, // Apply maxLength restriction
    ),
  );
}


class InputFieldPassword extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;

  const InputFieldPassword({
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputFieldPassword> {
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _isObscured,
        cursorColor: AppColors.blackcolor,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontFamily: 'MontserratMedium',
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 13,
            fontFamily: 'MontserratRegular',
          ),
          contentPadding: EdgeInsets.all(8),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.darkgreycolor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.darkgreycolor.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}

Widget buildDividerText(String text) {
  return Row(
    children: [
      Expanded(
        child: Divider(
          color: AppColors.Dividercolor,
          indent: 20,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          text,
          style: TextStyles.MontserratMedium,
        ),
      ),
      Expanded(
        child: Divider(
          endIndent: 20,
          color: AppColors.Dividercolor,
        ),
      ),
    ],
  );
}

Widget buildSocialLoginButton(String imageAsset, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.contcolor1,
        ),alignment: Alignment.center,
        child: Image.asset(imageAsset,height: 23,width: 23,),
      ),
    ),
  );
}
Widget showLottieAnimation(BuildContext context, String url) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Lottie.asset(
                alignment: Alignment.center,
                height: 300,
                width: 300,
                animate: true,
                reverse: true,
                url,
                // Use the new URL
                onLoaded: (composition) {
                  Future.delayed(composition.duration, () {
                    Navigator.of(context).pop();
                  });
                },
              ),
              Text('Log in', style: TextStyles.Merribold2),

            ],
          ),
        ),
      ),
    );
  }class AlertDialogBox extends StatelessWidget {

  final String message; // Define a parameter for the message

  const AlertDialogBox({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.error,
                size: 30,
                color: AppColors.contcolor,
              ),
              SizedBox(width: 10),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    message,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyles.MontserratBold3,
                  ),
                ),
              ),
            ],
          ),
        ),
        // SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "OK",
                    style: TextStyles.MontserratBold12,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5))),
        )
      ],
    );
  }
}
showErrorSnackbar(String msg, {SnackPosition? position}) {
  Get.closeAllSnackbars();
  Get.snackbar(
    '',
    '',
    messageText: Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        msg,
        style: TextStyles.Merribold1,
      ),
    ),
    titleText: const SizedBox.shrink(),
    snackPosition: position ?? SnackPosition.BOTTOM,
    backgroundColor: Colors.red[900],
    dismissDirection: DismissDirection.horizontal,
    margin: const EdgeInsets.all(20),
  );
}


