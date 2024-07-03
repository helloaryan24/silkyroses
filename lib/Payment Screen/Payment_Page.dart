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
            const EdgeInsets.only(top: 0, bottom: 20, left: 10, right: 10),
            child: Column(
              children: [
                SizedBox(height: 30),
                CustomAppbarWidget(),
                SizedBox(height: 30),
                Image.asset(Images.paymentpageimage, width: screenSize.width),
                SizedBox(height: 30),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Select shipping method',
                        style: TextStyles.Merriblack1)),
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
                  height: 30,
                ),
                Image.asset(Images.dotline, width: screenSize.width),
                SizedBox(
                  height: 50,
                ),
                Obx(() {
                  if (controller.selectedPaymentMethod.value == 'Credit Cart') {
                    // return _buildCreditCardForm(controller);
                    return Center(
                        child: Text(
                          'Credit Cart selected',
                          style: TextStyles.Merriblack4,
                        ));
                  } else if (controller.selectedPaymentMethod.value ==
                      'Cash on Delivery') {
                    return Center(
                        child: Text(
                      'Cash on Delivery selected',
                      style: TextStyles.Merriblack4,
                    ));
                  } else {
                    return Center(
                        child: Text(
                            '${controller.selectedPaymentMethod.value} selected',
                            style: TextStyles.Merriblack4));
                  }
                }),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: CustomButton(
                    backgroundColor: AppColors.contcolor,
                    onTap: () {
                      Get.to(() => ConfirmationPage());
          
                    },
                    text: 'Pay now',
                    style: TextStyles.Merribold1,
                  ),
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
                    ? AppColors.contcolor
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
                  style: TextStyles.Merriblack5,

                ),
              ],
            ),
          ),
        ));
  }
}
