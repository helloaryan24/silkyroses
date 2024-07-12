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
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppbarWidget(),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Obx(
                    () => TextField(
                      controller: controller.textController.value,
                      cursorColor: AppColors.blackcolor,
                      onChanged: (value) => controller.text.value = value,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'MontserratMedium',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search here..",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontFamily: 'MontserratRegular',
                        ),
                        prefixIcon: GestureDetector(
                          child: Icon(
                            Icons.search,
                            color: AppColors.blackcolor.withOpacity(0.8),
                          ),
                        ),
                        suffixIcon: SuffixIconWidget(),
                        contentPadding: EdgeInsets.all(5),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.darkgreycolor.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.darkgreycolor.withOpacity(0.2),
                          ),
                          // borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(5),
                        ),
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
                    return MatchesGridView(index, controller, context);
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

Widget MatchesGridView(int index, ProductsController controller, context) {
  return Obx(() => GestureDetector(
        onTap: () {
          controller.navigateToprodutspage();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage(controller.imageGridViewurl[index]),
                    ),
                  ),
                  child: SizedBox(
                    height: 35,
                    width: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.toggleIconState(index);
                      },
                      child: Icon(
                        controller.iconFilledState[index]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                        size: 20,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        elevation: 2,
                        padding: EdgeInsets.all(5),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    controller.GridViewNames[index],
                    style: TextStyles.MontserratSemiBold2,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(controller.GridViewprices[index],
                      style: TextStyles.MontserratSemiBold2),
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 60,
                      color: Colors.amber,
                      alignment: Alignment.center,
                      child: Text(
                        "50% off",
                        style: TextStyles.MontserratBold11,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('(243)', style: TextStyles.MontserratBold9),
                    Icon(Icons.star, color: Colors.amber, size: 18),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton6(
                    text: "Add to cart",
                    backgroundColor: AppColors.contcolor.withOpacity(0.8),
                    onTap: () {},
                    style: TextStyles.MontserratBold2),
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
    return 1.2 / 2.0;
  } else if (screenWidth >= 305) {
    print("Screen width >= 305, applying aspect ratio 1.50 / 2.9");
    return 1.5 / 2.9;
  } else {
    print("Screen width < 305, applying aspect ratio 2.5 / 3");
    return 2.5 / 3;
  }
}
