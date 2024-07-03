import 'package:flutter/material.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/Size.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/Search_page_Controller.dart';
import '../ZoomDrawer/MenuScreen.dart';

class SearchPage extends StatelessWidget {
  final Search_Controller searchController = Get.put(Search_Controller());

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context);

    return  SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.contcolor2,
        body: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: customAppbarhomescreen(context),
              ),
              SizedBox(height: 10),
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
                      controller: searchController.textController.value,
                      cursorColor: AppColors.blackcolor,
                      onChanged: (value) {
                        searchController.text.value = value;
                        // Update filtered list based on search query
                      },
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
                        suffixIcon: GestureDetector(
                          onTap: () {
                            searchController.textController.value.clear();
                            // Clear search results
                          },
                          child: Icon(
                            Icons.clear,
                            color: AppColors.blackcolor.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Obx(() {
                  return searchController.text.value.isEmpty
                      ? Center(
                          child: Text('Please search for products.',
                              style: TextStyles.Merriblack4))
                      : ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: searchController.imageGridViewurl.length,
                          itemBuilder: (context, index) {
                            return Obx(() => Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      Get.toNamed('/products_details');
                                    },
                                    child: Container(
                                      // height: 140,
                                      width: screenSize.width,
                                      decoration: BoxDecoration(
                                        color: AppColors.whitecolor,
                                        borderRadius: BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.greycolor
                                                .withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 120,
                                            height: 120,
                                            alignment: Alignment.bottomRight,
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
                                          SizedBox(width: 5,),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 5,),
                                                Text(
                                                    searchController
                                                        .GridViewNames[index],
                                                    style:
                                                        TextStyles.Merriblack4),
                                                SizedBox(height: 5),
                                                Text(
                                                  searchController
                                                      .GridViewprices[index],
                                                  style: TextStyles.Merriblack,
                                                ),
                                                SizedBox(height: 5),
                                                FlutterRating(
                                                  rating: 4.5,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  size: 18,
                                                  borderColor: Colors.amber,
                                                  allowHalfRating: true,
                                                ),
                                                SizedBox(height: 5),
                                                SizedBox(
                                                  height: 50,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          searchController
                                                              .toggleIconState(
                                                                  index);
                                                        },
                                                        child: Icon(
                                                          size: 22,
                                                          searchController
                                                                      .iconFilledState[
                                                                  index]
                                                              ? Icons.favorite
                                                              : Icons
                                                                  .favorite_border,
                                                          color: searchController
                                                                      .iconFilledState[
                                                                  index]
                                                              ? Colors.red
                                                              : Colors.red,
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape: CircleBorder(),
                                                          elevation: 2,
                                                          padding:
                                                              EdgeInsets.all(10),
                                                          backgroundColor:
                                                              Colors.white,
                                                          // <-- Button color
                                                          foregroundColor: Colors
                                                              .red, // <-- Splash color
                                                        ),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () {},
                                                        child: Icon(
                                                            Icons.shopping_cart,
                                                            color: Colors.white),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape: CircleBorder(),
                                                          elevation: 2,
                                                          padding:
                                                              EdgeInsets.all(10),
                                                          backgroundColor:
                                                              AppColors.contcolor,
                                                          // <-- Button color
                                                          foregroundColor: Colors
                                                              .red, // <-- Splash color
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),


                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                          },
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
