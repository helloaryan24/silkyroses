import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/Payment_Page_Controller.dart';
import 'Confirm_Payment_Page.dart';

class Payment_Page extends StatelessWidget {
  final PaymentPageController controller = Get.put(PaymentPageController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.contcolor2,
        body: SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
            child: Column(
              children: [
                CustomAppbarWidget(),
                SizedBox(height: 30),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Select shipping method',
                        style: TextStyles.MontserratSemiBold1)),
                SizedBox(height: 20),
                Column(
                  children: [
                    _buildPaymentOption('Credit Cart', controller),
                    SizedBox(height: 20),
                    _buildPaymentOption('Phone Pay', controller),
                    SizedBox(height: 20),
                    _buildPaymentOption('Google Pay', controller),
                    SizedBox(height: 20),
                    _buildPaymentOption('Cash on Delivery', controller),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Obx(() {
                  if (controller.selectedPaymentMethod.value == 'Credit Cart') {
                    // return _buildCreditCardForm(controller);
                    return Center(
                        child: Text(
                          'Credit Cart selected',
                          style: TextStyles.MontserratBold7,
                        ));
                  } else if (controller.selectedPaymentMethod.value ==
                      'Cash on Delivery') {
                    return Center(
                        child: Text(
                      'Cash on Delivery selected',
                      style: TextStyles.MontserratBold7,
                    ));
                  } else {
                    return Center(
                        child: Text(
                            '${controller.selectedPaymentMethod.value} selected',
                            style: TextStyles.MontserratBold7));
                  }
                }),
                SizedBox(
                  height: 20,
                ),
                CustomButton5(
                  backgroundColor: AppColors.contcolor,
                  onTap: () {
                    Get.to(() => ConfirmationPage());
                  },
                  text: 'Pay Now',
                  style: TextStyles.MontserratMedium1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildPaymentOption(String method, PaymentPageController controller) {
    return Obx(() => GestureDetector(
          onTap: () {
            controller.selectedPaymentMethod.value = method;
          },
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.whitecolor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greycolor.withOpacity(0.8),
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ],
              border: Border.all(
                color: controller.selectedPaymentMethod.value == method
                    ? AppColors.contcolor5
                    : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  method == 'Credit Cart'
                      ? Images.cartpay
                      : method == 'Phone Pay'
                          ? Images.phonepay
                          : method == 'Google Pay'
                              ? Images.gpay
                              : Images.codpay,
                  height: 30,
                  width: 30,
                ),
                SizedBox(width: 20),
                Text(
                  method,
                  style: TextStyles.MontserratBold4,

                ),
              ],
            ),
          ),
        ));
  }
}
