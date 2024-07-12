import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/Track_order_Controller.dart';

class TrackOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TrackOrderController trackOrderController =
        Get.put(TrackOrderController());
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.contcolor2,
        body: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppbarWidget(),
              SizedBox(height: 10,),
              Expanded(
                child: Container(
                  width: screenSize.width,
                  child: Obx(() {
                    if (trackOrderController.orders.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return ListView.builder(
                      itemCount: trackOrderController.orders.length,
                      itemBuilder: (context, index) {
                        final order = trackOrderController.orders[index];
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
      color: AppColors.whitecolor,
      elevation: 2,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Estimated time: ${order.estimatedTime}',
                      style: TextStyles.MontserratRegular1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Order number: ${order.orderNumber}',
                      style: TextStyles.MontserratRegular1,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Stepper(
              type: StepperType.vertical,
              physics: ClampingScrollPhysics(),
              onStepTapped: (int) {
                print("onStepTapped");
              },
              onStepContinue: () {
                Get.offAllNamed('/BottomBar_Page');
              },
              onStepCancel: () {
                Get.back();
              },
              currentStep: order.statuses.length - 1,
              steps: order.statuses.map((status) {
                return Step(
                  stepStyle: StepStyle(
                      color: AppColors.blackcolor,
                      border: Border.all(width: 1, color: AppColors.contcolor)),
                  title: Text(status.status, style: TextStyles.MontserratBold4),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(status.description, style: TextStyles.MontserratMedium4),
                      Text(
                        '${status.date.hour}:${status.date.minute}AM - ${status.date.day} ${status.date.month}, ${status.date.year}',
                        style: TextStyles.MontserratSemiBold,
                      ),
                    ],
                  ),
                  content: Text("5 Step Complete after deliverd your order",
                      style: TextStyles.MontserratSemiBold1),
                  isActive: true,
                  state: StepState.complete,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
