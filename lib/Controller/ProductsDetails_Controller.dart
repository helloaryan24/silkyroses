import 'package:get/get.dart';

class ProductsDetailsController extends GetxController {
  RxInt counter = 0.obs;
  RxBool isFavorite = false.obs; // Reactive boolean for favorite status

  void incrementCounter() {
    counter.value++;
  }

  void decrementCounter() {
    if (counter.value > 1) {
      counter.value--;
    }
  }

  void toggleFavorite() {
    isFavorite.toggle(); // Toggle the favorite status
  }
}
