import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PaymentPageController extends GetxController {
  var selectedPaymentMethod = 'Credit Card'.obs;
  var cardNumber = ''.obs;
  var cardHolderName = ''.obs;
  var expiryDate = ''.obs;
  var expiryYear = ''.obs;
  var cvv = ''.obs;  var saveCardDetails = false.obs; // Add this line

}
