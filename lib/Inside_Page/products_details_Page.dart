import 'package:flutter/material.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/Size.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/ProductsDetails_Controller.dart';

class products_details extends StatelessWidget {
  final ProductsDetailsController productsDetailsController =
  Get.put(ProductsDetailsController());

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.contcolor2,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 30, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      Images.backimage,
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Image.asset(
                    Images.logoimage,
                    width: screenSize.width * 0.5,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle notifications
                    },
                    child: Image.asset(
                      Images.notificationimage,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: screenSize.width,
                  height: 280,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: screenSize.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red.withOpacity(0.2),
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  productsDetailsController.toggleFavorite();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Obx(
                                        () => Icon(
                                      productsDetailsController.isFavorite.value
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      size: 30,
                                      color: productsDetailsController
                                          .isFavorite.value
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: images.length,
                effect: ScrollingDotsEffect(
                  activeStrokeWidth: 2.2,
                  activeDotScale: 1.3,
                  maxVisibleDots: 5,
                  radius: 8,
                  spacing: 10,
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: Colors.grey.shade400,
                  activeDotColor: AppColors.contcolor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: AppColors.contcolor3,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.Dividercolor,
                      width: 3,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          'Bouquet “Autumn”',
                          style: TextStyles.Merribold4,
                        ),
                        Row(
                          children: [
                            FlutterRating(
                              rating: 4.5,
                              mainAxisAlignment: MainAxisAlignment.start,
                              size: 18,
                              borderColor: Colors.amber,
                              allowHalfRating: true,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "4.89 (41 reviews)",
                              style: TextStyles.MerriLight3,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text("Composition:", style: TextStyles.MerriRegular2),
                        Text(
                          "5 white flowers, 1 blue flower",
                          style: TextStyles.MerriLight3,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "\$ 210",
                              style: TextStyles.Merriblack6,
                            ),
                            SizedBox(width: 50),
                            Container(
                              width: 110,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.contcolor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.remove,
                                        color: AppColors.contcolor),
                                    onPressed: productsDetailsController
                                        .decrementCounter,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 2,
                                      right: 2,
                                    ),
                                    child: Obx(
                                          () => Text(
                                        '${productsDetailsController.counter.value}',
                                        style: TextStyles.Merriblack5,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add,
                                        color: AppColors.contcolor),
                                    onPressed: productsDetailsController
                                        .incrementCounter,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: AppColors.Dividercolor,
                          height: 10,
                          thickness: 1,
                        ),
                        Text(
                          "You Might Also Like:",
                          style: TextStyles.MerriRegular2,
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 80,
                          width: screenSize.width,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: images.length.clamp(0, 3),
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.Dividercolor,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  images[index],
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, // Number of items per row
                              mainAxisSpacing:
                              10.0, // Spacing between items vertically
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: 55,
          color: AppColors.contcolor.withOpacity(0.2),
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    backgroundColor: AppColors.contcolor,
                    onTap: () {
                      // Handle Add to Cart
                    },
                    text: 'Add to cart',
                    style: TextStyles.Merribold1,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: CustomButton1(
                    backgroundColor: AppColors.contcolor,
                    onTap: () {
                      // Handle Buy Now
                    },
                    text: 'Buy now',
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
}
