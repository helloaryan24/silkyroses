// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../All_Custom_Faction/All_Widget.dart';
// import '../All_Custom_Faction/Colors.dart';
// import '../All_Custom_Faction/Image.dart';
// import '../All_Custom_Faction/TextStyle.dart';
// import '../Controller/Signup_controller.dart';
// import 'Authentication_Widget/Authentication_Widget.dart';
//
// class Signup_Page extends StatefulWidget {
//   const Signup_Page({super.key});
//
//   @override
//   State<Signup_Page> createState() => _Signup_PageState();
// }
//
// class _Signup_PageState extends State<Signup_Page> {
//   final SignUpController sigupController = Get.put(SignUpController());
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//
//     return SafeArea(
//         child: Scaffold(
//       body: Container(
//         width: screenSize.width,
//         height: screenSize.height,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(Images.signupbg),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(top: 80, right: 10, left: 10),
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(20),
//                     topLeft: Radius.circular(20)),
//                 color: AppColors.contcolor2),
//             child: Padding(
//               padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 30,),
//                     Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text('Sign Up', style: TextStyles.Merribold2)),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     buildInputField(
//                       hintText: 'First name',
//                       controller: sigupController.firstnameController,
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     buildInputField(
//                       hintText: 'Email address',
//                       controller: sigupController.emailaddressController,
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     buildInputField(
//                       hintText: 'Password',
//                       controller: sigupController.passwordController,
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     buildInputField(
//                       hintText: 'Confirm Password',
//                       controller: sigupController.confirmpasswordController,
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     CustomButton(
//                       backgroundColor: AppColors.contcolor,
//                       onTap: (){
//                         sigupController.register();
//                       },
//                       text: 'Sign Up',
//                       style: TextStyles.Merribold1,
//                     ),
//                     SizedBox(height: 20),
//
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20.0, vertical:0),
//                       child: buildDividerText('Continue with'),
//                     ),
//                     SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         buildSocialLoginButton(Images.logogoogle, () {
//                           // Handle onTap logic here
//                           print(' button tapped');
//                         },),
//                         buildSocialLoginButton(Images.logoapple, () {
//                           // Handle onTap logic here
//                           print(' button tapped');
//                         },),
//                         buildSocialLoginButton(Images.logofacebook, () {
//                           // Handle onTap logic here
//                           print(' button tapped');
//                         },),
//                       ],
//                     ),
//                     SizedBox(height: 15),
//
//                     Align(
//                         alignment: Alignment.center,
//                         child: Text('OR', style: TextStyles.MerriLight1)),
//                     SizedBox(height: 15),
//                     // CustomButton1(
//                     //   backgroundColor: AppColors.contcolor1,
//                     //   onTap: () {
//                     //     // Handle continue as guest logic
//                     //   },
//                     //   text: 'Continue as a guest',
//                     //   style: TextStyles.Merribold4,
//                     // ),
//                     // SizedBox(height: 20),
//                     GestureDetector(
//                       onTap: (){
//                         sigupController.signup();
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('Already have ', style: TextStyles.MerriLight),
//                           Text('an account ? Log in', style: TextStyles.Merribold3),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20),
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/Signup_controller.dart';
import 'Authentication_Widget/Authentication_Widget.dart';

class Signup_Page extends StatelessWidget {
  final SignUpController signUpController = Get.put(SignUpController());

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
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.contcolor4.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 10, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sign Up', style: TextStyles.MontserratBold),
                      SizedBox(height: 30),
                      buildInputField(
                        hintText: 'First Name',
                        controller: signUpController.firstNameController,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 10),
                      buildInputField(
                        hintText: 'Last Name',
                        controller: signUpController.lastNameController,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 10),
                      buildInputField(
                        hintText: 'Email Address',
                        controller: signUpController.emailAddressController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(height: 45,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Country Code',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                value: signUpController.countryCodes[0],
                                onChanged: (value) {},
                                items: signUpController.countryCodes
                                    .map((code) => DropdownMenuItem(
                                          value: code,
                                          child: Text(
                                            code,
                                            style: TextStyles.MontserratBold3,
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 5,
                            child: buildInputField(
                              hintText: 'Phone Number',
                              controller:
                                  signUpController.phoneNumberController,
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      buildInputField(
                        hintText: 'Address',
                        controller: signUpController.addressController,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 10),
                      buildInputField(
                        hintText: 'Location',
                        controller: signUpController.locationController,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 10),
                      buildInputField(
                        hintText: 'Password',
                        controller: signUpController.passwordController,
                        obscureText: false,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SizedBox(height: 10),
                      buildInputField(
                        hintText: 'Confirm Password',
                        controller: signUpController.confirmPasswordController,
                        obscureText: false,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Obx(() => Checkbox(
                                activeColor: Colors.red,
                                value: signUpController.policyAccepted.value,
                                onChanged: (value) {
                                  signUpController.policyAccepted.value =
                                      value!;
                                },
                              )),
                          Text('I agree to the policy and terms.',
                              style: TextStyles.MontserratMedium2),
                        ],
                      ),
                      SizedBox(height: 20),
                      CustomButton5(
                        backgroundColor: AppColors.contcolor4,
                        onTap: () {
                          signUpController.register();
                        },
                        text: 'Sign Up',
                        style: TextStyles.MontserratMedium1,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: buildDividerText('Continue with'),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildSocialLoginButton(Images.logogoogle, () {
                            // Handle Google sign-in logic
                            print('Google sign-in tapped');
                          }),
                          buildSocialLoginButton(Images.logoapple, () {
                            // Handle Apple sign-in logic
                            print('Apple sign-in tapped');
                          }),
                          buildSocialLoginButton(Images.logofacebook, () {
                            // Handle Facebook sign-in logic
                            print('Facebook sign-in tapped');
                          }),
                        ],
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          // Navigate to login page
                          Get.toNamed('/LoginPage');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account ? ',
                                style: TextStyles.MontserratMedium2),
                            Text('Log in', style: TextStyles.MontserratBold2),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
