import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeController extends GetxController {
  RxBool showWelcomeText = false.obs;
  RxBool showLogo = false.obs;
  RxBool showJoinUsText = false.obs;
  RxBool showContinueButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    startAnimationSequence();
  }

  void startAnimationSequence() async {
    await Future.delayed(Duration(milliseconds: 500));
    showWelcomeText.value = true;

    await Future.delayed(Duration(milliseconds: 500));
    showLogo.value = true;

    await Future.delayed(Duration(milliseconds: 500));
    showJoinUsText.value = true;

    await Future.delayed(Duration(milliseconds: 500));
    showContinueButton.value = true;
  }

  void continuee() async {
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
