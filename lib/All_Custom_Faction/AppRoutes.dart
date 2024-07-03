
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Authentication_Screen/ForgetPassword_page.dart';
import '../Authentication_Screen/OTPVerification_Page.dart';
import '../Authentication_Screen/SignUp_page.dart';
import '../Authentication_Screen/Welcome_page.dart';
import '../Authentication_Screen/login_page.dart';
import '../Bottom_bar/Bottom_Bar_Page.dart';
import '../Payment Screen/Check_out_page.dart';
import '../Inside_Page/Filter_Page.dart';
import '../Inside_Page/Products_Page.dart';
import '../Inside_Page/products_details_Page.dart';

class AppRoutes {
  static const String initial = '/';
  static const String LoginPage = '/Login_Page';
  static const String SignupPage = '/Signup_Page';
  static const String BottomBarPage = '/BottomBar_Page';
  static const String ForgetpasswordPage = '/Forgetpassword_Page';
  static const String OTPVerificationPage = '/OTPVerification_Page';
  static const String ProductsPage = '/Products_Page';
  static const String productsdetails = '/products_details';
  static const String Checkoutpage = '/Check_out_page';
  static const String filtere = '/Filter_Page';

  static final routes = [

    GetPage(
      name: initial,
      page: () => Welcome_Page(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: LoginPage,
      page: () => Login_Page(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: SignupPage,
      page: () => Signup_Page(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: BottomBarPage,
      page: () => BottomBar_Page(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: ForgetpasswordPage,
      page: () => Forgetpassword_Page(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: OTPVerificationPage,
      page: () => OTPVerification_Page(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: ProductsPage,
      page: () => Products_Page(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: productsdetails,
      page: () => products_details(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: filtere,
      page: () => Filter_Page(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: Checkoutpage,
      page: () => Check_out_page(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),


  ];
}
