import 'package:get/get.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class BottomBarController extends GetxController with SingleGetTickerProviderMixin {
  MotionTabBarController? motionTabBarController;

  @override
  void onInit() {
    super.onInit();
    motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 5,
      vsync: this,
    );
    update(); // Call update to rebuild GetBuilder widgets
  }

  void changeTabIndex(int index) {
    motionTabBarController?.index = index;
    update(); // Call update to rebuild GetBuilder widgets
  }

  @override
  void onClose() {
    motionTabBarController?.dispose();
    super.onClose();
  }
}
