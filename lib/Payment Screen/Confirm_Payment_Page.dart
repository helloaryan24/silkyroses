import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silkyroses/Authentication_Screen/Welcome_page.dart';
import 'package:silkyroses/Payment%20Screen/Thank_you_Page.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/Confirm_Payment_Controller.dart';

class ConfirmationPage extends StatelessWidget {
  final Confirm_Payment_Controller ConfirmPaymentController = Get.put(
      Confirm_Payment_Controller());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 0, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbarWidget(),
                SizedBox(height: 30),
                Image.asset(Images.confrimimgtop, width: screenSize.width),
                SizedBox(height: 50),
                _buildSectionTitle('Check and confirm your order'),
                SizedBox(height: 16),
                _buildInfoCard('Shipping address',
                    'Sofiia Mykhailova 46900, Mary Antribue 67, Colorado, USA',
                    true),
                SizedBox(height: 16),
                _buildInfoCard('Payment details', 'XXXX-XXXX-XXXX-XXXX', true),
                SizedBox(height: 20),
                Image.asset(Images.dotline, width: screenSize.width),
                SizedBox(height: 20),
                Container(
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: AppColors.contcolor3,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                    border: Border.all(color: AppColors.Dividercolor, width: 3),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Price details',
                          style: TextStyles.Merriblack1,
                        ),
                        SizedBox(
                          height: 5,
                        ),


                        Divider(
                          color: AppColors.Dividercolor,
                          height: 10,
                          thickness: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal", style: TextStyles.MerriLight3),
                            Obx(() =>
                                Text(
                                    "${ConfirmPaymentController.totalAmount
                                        .value} \$",
                                    style: TextStyles.MerriLight4)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery Fee", style: TextStyles.MerriLight3),
                            Text("Free", style: TextStyles.MerriLight4),
                          ],
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.Dividercolor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyles.Merriblack4,
                                ),
                                Obx(() =>
                                    Text(
                                      "${ConfirmPaymentController.totalAmount
                                          .value} \$",
                                      style: TextStyles.Merriblack,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomButton(
                          backgroundColor: AppColors.contcolor,
                          onTap: () {
                            Get.to(() => Thank_You_Page());
                            // Add checkout logic here
                          },
                          text: 'Confirm order',
                          style: TextStyles.Merribold1,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text('Your order:', style: TextStyles.Merriblack1),
                SizedBox(height: 20),

                Container(
                  height: ConfirmPaymentController.items.isNotEmpty ? 300 : 50,
                  width: screenSize.width,
                  child: ConfirmPaymentController.items.isNotEmpty
                      ? Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Obx(() =>
                        ListView.separated(
                          itemCount: ConfirmPaymentController.items.length,
                          separatorBuilder: (context, index) =>
                              Divider(
                                  height: 0, color: AppColors.Dividercolor),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            final item = ConfirmPaymentController.items[index];
                            return Padding(
                              padding: EdgeInsets.all(5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      alignment: Alignment.topLeft,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        border: Border.all(
                                          width: 1,
                                          color: AppColors.Dividercolor,
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              Images.homelistroseimg),
                                          fit: BoxFit.cover,
                                        ),
                                        color:
                                        Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 5,
                                          top: 10,
                                          bottom: 10,
                                          right: 5,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .center,
                                              children: [
                                                Text(
                                                  item.name,
                                                  style: TextStyles
                                                      .Merriblack4,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    ConfirmPaymentController
                                                        .removeItem(
                                                        index);
                                                  },
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: AppColors
                                                        .contcolor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "\$ ${item.price}",
                                              style:
                                              TextStyles.Merriblack,
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            // Obx(() => Text(
                                            //   'Quantity: ${item.quantity.value}',
                                            //   style: TextStyles
                                            //       .Merriblack5,
                                            // )),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            // Container(
                                            //   width: 110,
                                            //   height: 40,
                                            //   alignment: Alignment.center,
                                            //   decoration: BoxDecoration(
                                            //     color: AppColors.contcolor
                                            //         .withOpacity(0.1),
                                            //     borderRadius:
                                            //     BorderRadius.circular(
                                            //         20),
                                            //   ),
                                            //   child: Row(
                                            //     mainAxisAlignment:
                                            //     MainAxisAlignment
                                            //         .spaceBetween,
                                            //     crossAxisAlignment:
                                            //     CrossAxisAlignment
                                            //         .center,
                                            //     children: <Widget>[
                                            //       IconButton(
                                            //         icon: Icon(
                                            //             Icons.remove,
                                            //             color: AppColors
                                            //                 .contcolor),
                                            //         onPressed: () {
                                            //           ConfirmPaymentController
                                            //               .decrementQuantity(
                                            //               index);
                                            //         },
                                            //       ),
                                            //       Padding(
                                            //         padding:
                                            //         const EdgeInsets
                                            //             .only(
                                            //             left: 2,
                                            //             right: 2),
                                            //         child: Obx(
                                            //               () => Text(
                                            //             '${item.quantity.value}',
                                            //             style: TextStyles
                                            //                 .Merriblack5,
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       IconButton(
                                            //         icon: Icon(Icons.add,
                                            //             color: AppColors
                                            //                 .contcolor),
                                            //         onPressed: () {
                                            //           ConfirmPaymentController
                                            //               .incrementQuantity(
                                            //               index);
                                            //         },
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                  )
                      : Center(
                      child: Text(
                        "No available Products in cart",
                        style: TextStyles.Merriblack4,
                      )),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildSectionTitle(String title) {
    return Text(title, style: TextStyles.Merriblack1);
  }

  Widget _buildInfoCard(String title, String content, bool editable) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(

        title: Text(title, style: TextStyles.Merriblack1),
        subtitle: Text(content, style: TextStyles.MerriLight3),
        trailing: editable ? TextButton(onPressed: () {},
            child: Text('Edit', style: TextStyles.Merriblack8)) : null,
      ),
    );
  }
}