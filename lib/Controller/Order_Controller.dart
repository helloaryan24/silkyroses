import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Order {
  final String title;
  final String orderNumber;
  final String date;
  final double total;
  final String status;

  Order(this.title, this.orderNumber, this.date, this.total, this.status);
}

class OrderController extends GetxController {
  var orders = <Order>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  void fetchOrders() {
    var orderList = [
      Order('101 red roses', '#2482011', '15-07-2023', 934, 'Processing'),
      Order('101 red roses', '#2482011', '15-07-2023', 934, 'Processing'),
      Order('101 red roses', '#2482011', '15-07-2023', 934, 'Delivered'),
      Order('101 red roses', '#2482011', '15-07-2023', 934, 'Delivered'),
      Order('101 red roses', '#2482011', '15-07-2023', 934, 'Processing'),
      Order('101 red roses', '#2482011', '15-07-2023', 934, 'Delivered'),
    ];

    orders.assignAll(orderList);
  }
}