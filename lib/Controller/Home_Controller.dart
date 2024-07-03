import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<String> imagelisturl = [
    'assets/rose1.png',
    'assets/rose2.png',
    'assets/rose3.png',
    'assets/rose4.png',
  ];

  final List<String> interests = [
    'for Wedding',
    'Flowers in box',
    'for Birthday',
    'Roses',
  ];

  var isListening = false.obs;
  var text = ''.obs;
  var current = 0.obs;

  final RxList<String> selectedInterests = <String>[].obs;

  void toggleInterest(String interest) {
    if (selectedInterests.contains(interest)) {
      selectedInterests.remove(interest);
    } else {
      selectedInterests.add(interest);
    }
  }

  void updateCurrentIndex(int index) {
    current.value = index;
  }

  void toggleListening() {
    isListening.value = !isListening.value;
  }

  void updateText(String newText) {
    text.value = newText;
  }

  void gotoProductsPage() {
    Get.toNamed('/Products_Page');
  }
}
