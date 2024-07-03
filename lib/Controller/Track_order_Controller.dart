import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TrackOrderController extends GetxController {
  var orders = <Order>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  void fetchOrders() {
    var orderList = [
      Order(
        '101 red roses',
        '#2482011',
        '18 Dec 15:00',
        934,
        [
          OrderStatus('Order is received', 'The shop is preparing your order.', DateTime.parse('2023-07-05 10:00:00')),
          OrderStatus('Processing', 'The shop is processing your order.', DateTime.parse('2023-07-05 10:00:00')),
          OrderStatus('Shipped', 'The shop is preparing to ship your order.', DateTime.parse('2023-07-05 10:00:00')),
          OrderStatus('On the way', 'The shop is now delivering your order.', DateTime.parse('2023-07-05 10:00:00')),
          OrderStatus('Order delivered', 'Your order has been delivered.', DateTime.parse('2023-07-05 10:00:00')),
        ],
      ),

    ];

    orders.assignAll(orderList);
  }
}

class OrderStatus {
  final String status;
  final String description;
  final DateTime date;

  OrderStatus(this.status, this.description, this.date);
}

class Order {
  final String title;
  final String orderNumber;
  final String estimatedTime;
  final double total;
  final List<OrderStatus> statuses;

  Order(this.title, this.orderNumber, this.estimatedTime, this.total, this.statuses);
}
