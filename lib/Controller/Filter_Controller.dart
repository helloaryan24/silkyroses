import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  RxDouble minPrice = 0.0.obs;
  RxDouble maxPrice = 1000.0.obs;
  RxInt quantity = 0.obs;
  RxString color = ''.obs;
  RxString flowerType = ''.obs;
  RxString category = ''.obs;

  // Quantity options
  List<String> quantityOptions = ['10-50', '50-100', '100-200', '200+'];
  RxString selectedQuantityOption = ''.obs;

  // Color options
  List<String> colorOptions = ['Red', 'Blue', 'Green', 'Yellow'];
  RxString selectedColorOption = ''.obs;

  // Price options
  List<String> pricesOptions = ['High to low', 'Low to high'];
  RxString pricesOptionsOption = ''.obs;

  // Type of followers options (example with image URL)
  List<Map<String, dynamic>> followerTypeOptions = [
    {'name': 'Roses', 'image': 'assets/roseimage.png'},
    {'name': 'Lilies', 'image': 'assets/roseimage.png'},
    {'name': 'Tulips', 'image': 'assets/roseimage.png'},
    {'name': 'Orchids', 'image': 'assets/roseimage.png'},
  ];
  RxString selectedFollowerTypeOption = ''.obs;

  // Category options (example with rounded image URL)
  List<Map<String, dynamic>> categoryOptions = [
    {'name': 'Wedding', 'image': 'assets/roseimage.png'},
    {'name': 'Birthday', 'image': 'assets/roseimage.png'},
    {'name': 'Anniversary', 'image': 'assets/roseimage.png'},
  ];
  RxString selectedCategoryOption = ''.obs;

  // Map of color names to Color objects
  Map<String, Color> colorMap = {
    'Red': Colors.red,
    'Blue': Colors.blue,
    'Green': Colors.green,
    'Yellow': Colors.yellow,
  };

  void setQuantityOption(String option) {
    selectedQuantityOption.value = option;
    // Parse the selected option to set the quantity value
    switch (option) {
      case '10-50':
        quantity.value = 10;
        break;
      case '50-100':
        quantity.value = 50;
        break;
      case '100-200':
        quantity.value = 100;
        break;
      case '200+':
        quantity.value = 200;
        break;
      default:
        quantity.value = 0;
        break;
    }
  }

  void resetFilters() {
    minPrice.value = 0.0;
    maxPrice.value = 1000.0;
    quantity.value = 0;
    selectedQuantityOption.value = '';
    color.value = '';
    flowerType.value = '';
    category.value = '';
    selectedColorOption.value = '';
    selectedFollowerTypeOption.value = '';
    selectedCategoryOption.value = '';
    pricesOptionsOption.value = '';
  }

  void applyFilters() {
    // Implement logic to apply filters based on the values in the controller
    // Example: call API with filter parameters
    print('Applying filters...');
    print('Selected Price Option: ${pricesOptionsOption.value}');
    print('Quantity: ${quantity.value} (${selectedQuantityOption.value})');
    print('Color: ${selectedColorOption.value}');
    print('Flower Type: ${selectedFollowerTypeOption.value}');
    print('Category: ${selectedCategoryOption.value}');
  }
}
