import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import '../Controller/Cart_Controller.dart';
import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/Size.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../ZoomDrawer/MenuScreen.dart';

class Cart_Page extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context);

    return  SafeArea(
        child: Obx(() => Scaffold(
        backgroundColor: AppColors.contcolor2,
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: customAppbarhomescreen(context),
                ),
                Container(
                  height: 300,
                  width: screenSize.width,
                  child: cartController.items.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Obx(() => ListView.separated(
                                itemCount: cartController.items.length,
                                separatorBuilder: (context, index) => Divider(
                                    height: 0, color: AppColors.Dividercolor),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  final item = cartController.items[index];
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
                                            width: 100,
                                            height: 100,
                                            alignment: Alignment.bottomRight,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                                            .MontserratSemiBold,
                                                      ),
                                                      SizedBox(height: 30,width: 30,
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            cartController
                                                                .removeItem(
                                                                index);
                                                          },

                                                          child: Icon(
                                                              size: 15,
                                                              Icons.favorite
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            shape: CircleBorder(),
                                                            elevation: 2,
                                                            padding:
                                                            EdgeInsets.all(
                                                                2),
                                                            backgroundColor:
                                                            Colors.white,
                                                            // <-- Button color
                                                            foregroundColor: Colors
                                                                .red, // <-- Splash color
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                  Text(
                                                    "\$ ${item.price}",
                                                    style:
                                                        TextStyles.MontserratSemiBold2,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'in stock',
                                                        style: TextStyles
                                                            .MontserratBold8,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Obx(() => Text(
                                                            'Quantity: ${item.quantity.value}',
                                                            style: TextStyles
                                                                .MontserratBold8,
                                                          )),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    width: 110,
                                                    height: 40,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: AppColors.contcolor5
                                                          .withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        IconButton(
                                                          icon: Icon(
                                                              Icons.remove,
                                                              color: AppColors
                                                                  .contcolor5),
                                                          onPressed: () {
                                                            cartController
                                                                .decrementQuantity(
                                                                    index);
                                                          },
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 2,
                                                                  right: 2),
                                                          child: Obx(
                                                            () => Text(
                                                              '${item.quantity.value}',
                                                              style: TextStyles
                                                                  .Merriblack5,
                                                            ),
                                                          ),
                                                        ),
                                                        IconButton(
                                                          icon: Icon(Icons.add,
                                                              color: AppColors
                                                                  .contcolor5),
                                                          onPressed: () {
                                                            cartController
                                                                .incrementQuantity(
                                                                    index);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
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
                Container(
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: AppColors.contcolor3,
                    borderRadius: BorderRadius.all(Radius.circular(30),
                    ),
                    // border: Border.all(color: AppColors.Dividercolor, width: 3),
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
                          style: TextStyles.MontserratSemiBold1,
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        Container(
                          height: cartController.items.isEmpty
                              ? 0
                              : (cartController.items.length == 1 ? 40 : 60),
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: cartController.items.map((item) {
                                  print(cartController.items.length);
                                  return Container(
                                    margin: EdgeInsets.symmetric(vertical: 1),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${item.name}    x${item.quantity.value}",
                                          style: TextStyles.MontserratMedium3,
                                        ),
                                        Text(
                                          "${item.price * item.quantity.value} \$",
                                          style: TextStyles.MontserratMedium3,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),

                        Divider(
                          color: AppColors.Dividercolor,
                          height: 10,
                          thickness: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal", style: TextStyles.MontserratRegular1),
                            Obx(() => Text(
                                "${cartController.totalAmount.value} \$",
                                style: TextStyles.MontserratMedium3)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery Fee", style: TextStyles.MontserratRegular1),
                            Text("Free", style: TextStyles.MontserratRegular1),
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
                                  style: TextStyles.MontserratBold3,
                                ),
                                Obx(() => Text(
                                      "${cartController.totalAmount.value} \$",
                                      style: TextStyles.MontserratBold3,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomButton5(
                          backgroundColor: AppColors.contcolor,
                          onTap: () {
                            Get.toNamed('/Check_out_page');
                            // Add checkout logic here
                          },
                          text: 'Checkout',
                          style: TextStyles.MontserratMedium1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

    )));
  }
}
