import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/Size.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/Products_Controller.dart';
import 'Filter_Page.dart';

class Products_Page extends StatelessWidget {
  final ProductsController controller = Get.put(ProductsController());

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
              CustomAppbarWidget(),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 2, color: AppColors.Dividercolor),
                  ),
                  child: Obx(
                    () => TextField(
                      controller: controller.textController.value,
                      cursorColor: AppColors.blackcolor,
                      onChanged: (value) => controller.text.value = value,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'MerriweatherRegular',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 11, horizontal: 15),
                        hintText: "Search here..",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: 'MerriweatherLight',
                        ),
                        prefixIcon: GestureDetector(
                          child: Icon(
                            Icons.search,
                            color: AppColors.blackcolor.withOpacity(0.8),
                          ),
                        ),
                        suffixIcon: SuffixIconWidget(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: GridView.builder(
                  itemCount: controller.imageGridViewurl.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _calculateCrossAxisCount(context),
                    childAspectRatio: _calculateChildAspectRatio(context),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return MatchesGridView(index, controller);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget MatchesGridView(int index, ProductsController controller) {
  return Obx(() => GestureDetector(
        onTap: () {
          controller.navigateToprodutspage();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
              ),
            ],
            border: Border.all(width: 2, color: AppColors.Dividercolor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  controller.imageGridViewurl[index],
                  height: 130,
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star_border,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            '4.9',
                            style: TextStyles.Merriblack3,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => controller.toggleIconState(index),
                        child: Icon(
                          controller.iconFilledState[index]
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    controller.GridViewNames[index],
                    style: TextStyles.Merriblack3,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    controller.GridViewprices[index],
                    style: TextStyles.Merriblack1,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.contcolor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.cart,
                          color: Colors.white,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Add to cart",
                          style: TextStyles.Merribold3,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
}

int _calculateCrossAxisCount(BuildContext context) {
  return MediaQuery.of(context).size.width < 305 ? 1 : 2;
}

double _calculateChildAspectRatio(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth > 345) {
    print("Screen width > 345, applying aspect ratio 1.0 / 2.0");
    return 1.12 / 2.0;
  } else if (screenWidth >= 305) {
    print("Screen width >= 305, applying aspect ratio 1.50 / 2.9");
    return 1.40 / 2.9;
  } else {
    print("Screen width < 305, applying aspect ratio 2.5 / 3");
    return 2.5 / 3;
  }
}
