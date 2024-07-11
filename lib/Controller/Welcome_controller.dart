import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeController extends GetxController {
  RxBool showLogo = false.obs;
  RxBool showFlowers = false.obs;

  @override
  void onInit() {
    super.onInit();
    startAnimationSequence();
  }

  void startAnimationSequence() async {
    await Future.delayed(Duration(milliseconds: 500));
    showLogo.value = true;

    await Future.delayed(Duration(milliseconds: 500));
    showFlowers.value = true;

    await Future.delayed(Duration(seconds: 2));
    navigateToLogin();
  }

  void navigateToLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null && token.isNotEmpty) {
      // User is logged in, navigate to main screen
      Get.offAllNamed('/BottomBar_Page');
    } else {
      // User is not logged in, navigate to login screen
      Get.offNamed('/Login_Page');
    }
  }
}
