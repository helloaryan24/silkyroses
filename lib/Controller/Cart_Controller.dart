import 'package:get/get.dart';

class CartController extends GetxController {
  var items = <CartItem>[].obs;
  var totalAmount = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with multiple items
    items.addAll([
      CartItem(name: '101 red roses', price: 121.0, quantity: 1.obs),
      CartItem(name: '101 red roses', price: 121.0, quantity: 1.obs),
      CartItem(name: '101 red roses', price: 121.0, quantity: 1.obs),
      CartItem(name: '101 red roses', price: 121.0, quantity: 1.obs),
      CartItem(name: '101 red roses', price: 121.0, quantity: 1.obs),
    ]);
    calculateTotal();
  }

  void incrementQuantity(int index) {
    items[index].quantity.value++;
    calculateTotal();
  }

  void decrementQuantity(int index) {
    if (items[index].quantity.value > 1) {
      items[index].quantity.value--;
    }
    calculateTotal();
  }

  void removeItem(int index) {
    items.removeAt(index);
    calculateTotal();
  }

  void calculateTotal() {
    totalAmount.value =
        items.fold(0, (sum, item) => sum + item.price * item.quantity.value);
  }



}

class CartItem {
  String name;
  double price;
  RxInt quantity;

  CartItem({required this.name, required this.price, required this.quantity});
}
