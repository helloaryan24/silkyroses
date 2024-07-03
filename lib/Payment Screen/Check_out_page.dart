import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Authentication_Screen/Authentication_Widget/Authentication_Widget.dart';
import '../Controller/Checkout_Controller.dart';

class Check_out_page extends StatelessWidget {
  final CheckOutController checkOutController = Get.put(CheckOutController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.contcolor2,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, bottom: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbarWidget(),
              SizedBox(height: 30),
              Image.asset(Images.checkoutimgtop, width: screenSize.width),
              SizedBox(height: 30),
              ShippingMethodWidget(),
              SizedBox(height: 20),
              Image.asset(Images.dotline, width: screenSize.width),
              SizedBox(height: 20),
              ContactDetailsWidget(),
              SizedBox(height: 20),
              Image.asset(Images.dotline, width: screenSize.width),
              SizedBox(height: 20),
              DeliveryInformationWidget(),
              SizedBox(height: 20),
              CustomButton(
                backgroundColor: AppColors.contcolor,
                onTap: () {
                  checkOutController.submitCheckout();
                },
                text: 'Checkout',
                style: TextStyles.Merribold1,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class ShippingMethodWidget extends StatelessWidget {
  final CheckOutController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whitecolor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          border: Border.all(width: 2, color: AppColors.Dividercolor)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1. Select shipping method', style: TextStyles.Merriblack1),
            SizedBox(height: 10),
            Obx(() => RadioListTile(
                  value: 'home_delivery',
                  groupValue: controller.shippingMethod.value,
                  onChanged: (value) {
                    controller.shippingMethod.value = value as String;
                  },
                  activeColor: AppColors.contcolor,
                  title: Text('Home delivery\n(1-3 business days)',
                      style: TextStyles.Merriblack3),
                  subtitle: Text('Free', style: TextStyles.MerriLight4),
                )),
            Divider(height: 10, color: AppColors.Dividercolor),
            Obx(() => RadioListTile(
                  value: 'pickup_point',
                  activeColor: AppColors.contcolor,
                  groupValue: controller.shippingMethod.value,
                  onChanged: (value) {
                    controller.shippingMethod.value = value as String;
                  },
                  title: Text('Pickup Point\n(2-5 business days)',
                      style: TextStyles.Merriblack3),
                  subtitle: Text('Free', style: TextStyles.MerriLight4),
                )),
            Divider(height: 10, color: AppColors.Dividercolor),
            Obx(() => RadioListTile(
                  value: 'pickup_in_store',
                  activeColor: AppColors.contcolor,
                  groupValue: controller.shippingMethod.value,
                  onChanged: (value) {
                    controller.shippingMethod.value = value as String;
                  },
                  title: Text('Pickup in Store\n(2-5 business days)',
                      style: TextStyles.Merriblack3),
                  subtitle: Text('Free', style: TextStyles.MerriLight4),
                )),
          ],
        ),
      ),
    );
  }
}

class ContactDetailsWidget extends StatelessWidget {
  final CheckOutController controller = Get.find();
  final firstNameFocus = FocusNode();
  final lastNameFocus = FocusNode();
  final emailFocus = FocusNode();
  final phoneNumberFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whitecolor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          border: Border.all(width: 2, color: AppColors.Dividercolor)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('2. Fill the information below',
                style: TextStyles.Merriblack1),
            SizedBox(height: 10),
            Text('*Contact details', style: TextStyles.Merriblack2),
            SizedBox(height: 20),
            buildInputField(
                hintText: 'First name',
                controller: controller.firstnameController),
            SizedBox(height: 10),
            buildInputField(
                hintText: 'Last name',
                controller: controller.lastnameController),
            SizedBox(height: 10),
            buildInputField(
                hintText: 'Email',
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress),
            SizedBox(height: 10),
            buildNumberInputField(
              hintText: 'Phone number',
              controller: controller.phonenumberController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              context: context,
            ),
          ],
        ),
      ),
    );
  }
}

class DeliveryInformationWidget extends StatelessWidget {
  final CheckOutController controller = Get.find();
  final firstNameFocus = FocusNode();
  final lastNameFocus = FocusNode();
  final emailFocus = FocusNode();
  final postalcodeFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whitecolor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          border: Border.all(width: 2, color: AppColors.Dividercolor)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('*Delivery information', style: TextStyles.Merriblack2),
            SizedBox(height: 20),
            buildInputField(
                hintText: 'Country', controller: controller.countryController),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: buildInputField(
                      hintText: 'City', controller: controller.cityController),
                ),
                SizedBox(width: 10),
                Expanded(
                  child:  buildNumberInputField(
                    hintText: 'Postal code',
                    controller: controller.postalCodeController,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    context: context,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            buildInputField(
                hintText: 'Street', controller: controller.streetController),
            SizedBox(height: 10),
            buildInputField(
                hintText: 'Address details (optional)',
                controller: controller.addressDetailsController),
          ],
        ),
      ),
    );
  }
}
