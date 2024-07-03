import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../Payment Screen/Payment_Page.dart';

class CheckOutController extends GetxController {
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final phonenumberController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final postalCodeController = TextEditingController();
  final streetController = TextEditingController();
  final addressDetailsController = TextEditingController();

  var shippingMethod = 'home_delivery'.obs;

  @override
  void onClose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    phonenumberController.dispose();
    countryController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    streetController.dispose();
    addressDetailsController.dispose();
    super.onClose();
  }

  bool validateInputs() {
    if (firstnameController.text.isEmpty ||
        lastnameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phonenumberController.text.isEmpty ||
        countryController.text.isEmpty ||
        cityController.text.isEmpty ||
        postalCodeController.text.isEmpty ||
        streetController.text.isEmpty) {
      return false;
    }
    return true;
  }

  void submitCheckout() {
    if (validateInputs()) {
      print('Shipping Method: ${shippingMethod.value}');
      print('First Name: ${firstnameController.text}');
      print('Last Name: ${lastnameController.text}');
      print('Email: ${emailController.text}');
      print('Phone Number: ${phonenumberController.text}');
      print('Country: ${countryController.text}');
      print('City: ${cityController.text}');
      print('Postal Code: ${postalCodeController.text}');
      print('Street: ${streetController.text}');
      print('Address Details: ${addressDetailsController.text}');

      Get.to(() => Payment_Page());
    } else {
      showEmptyFieldDialog1();
    }
  }
}
