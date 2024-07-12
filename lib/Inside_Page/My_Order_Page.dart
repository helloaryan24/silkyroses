import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/Order_Controller.dart';
import 'Track_Order_Page.dart';

class My_Order_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OrderController controller = Get.put(OrderController());
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.contcolor2,
        body: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
          child: Column(
            children: [
              CustomAppbarWidget(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: screenSize.width,
                  child: Obx(() {
                    if (controller.orders.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                      itemCount: controller.orders.length,
                      itemBuilder: (context, index) {
                        final order = controller.orders[index];
                        return OrderCard(order: order);
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: AppColors.whitecolor,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.contcolor5.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5)),
                  child: Image.asset(
                    Images.homelistroseimg,
                    width: 45,
                    height: 45,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.title,
                      style: TextStyles.MontserratBold6,
                    ),
                    Text(
                      'Total: \$${order.total.toStringAsFixed(2)}',
                      style: TextStyles.MontserratSemiBold2,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Order Number: ${order.orderNumber}',
              style: TextStyles.MontserratMedium3,
            ),
            Text(
              'Date: ${order.date}',
              style: TextStyles.MontserratMedium3,
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: order.status == 'Processing'
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomButton4(
                          backgroundColor: AppColors.whitecolor,
                          onTap: () {},
                          text: 'Processing',
                          style: TextStyles.MontserratBold1,
                        ),
                        SizedBox(width: 8),
                        CustomButton3(
                          backgroundColor:
                              AppColors.contcolor5,
                          onTap: () {
                            Get.to(() => TrackOrderPage());
                            // Add Log out logic here
                          },
                          text: 'Track Order',
                          style: TextStyles.MontserratBold2,
                        ),
                      ],
                    )
                  : CustomButton6(
                      backgroundColor: AppColors.contcolor,
                      onTap: () {
                        Get.to(() => TrackOrderPage());
                        // Add Log out logic here
                      },
                      text: 'Delivered',
                      style: TextStyles.MontserratBold2,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
