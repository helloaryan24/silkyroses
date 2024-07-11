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

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.contcolor2,
        body: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 0, left: 10, right: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: customAppbarhomescreen(context),
              ),
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
                      controller: searchController.textController.value,
                      cursorColor: AppColors.blackcolor,
                      onChanged: (value) {
                        searchController.text.value = value;
                        // Update filtered list based on search query
                      },
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'MontserratMedium',
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: AppColors.whitecolor,
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
                        contentPadding: EdgeInsets.all(8),
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
              SizedBox(height: 10),
              Expanded(
                child: Obx(() {
                  return searchController.text.value.isEmpty
                      ? Center(
                          child: Text('Please search for products.',
                              style: TextStyles.MontserratBold7))
                      : ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: searchController.imageGridViewurl.length,
                          itemBuilder: (context, index) {
                            return Obx(() => Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/products_details');
                                    },
                                    child: Container(
                                      // height: 140,
                                      width: screenSize.width,
                                      decoration: BoxDecoration(
                                        color: AppColors.whitecolor,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 2,
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
                                                  BorderRadius.circular(5),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    Images.homelistroseimg),
                                                fit: BoxFit.cover,
                                              ),
                                              color:
                                                  Colors.white.withOpacity(0.5),
                                            ),
                                            child: SizedBox(height: 35,width: 35,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  searchController
                                                      .toggleIconState(
                                                      index);
                                                },
                                                child: Icon(
                                                  size: 18,
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
                                                  EdgeInsets.all(
                                                      5),
                                                  backgroundColor:
                                                  Colors.white,
                                                  // <-- Button color
                                                  foregroundColor: Colors
                                                      .red, // <-- Splash color
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                    searchController
                                                        .GridViewNames[index],
                                                    style:
                                                        TextStyles.MontserratSemiBold),
                                                SizedBox(height: 5),
                                                Text(
                                                  searchController
                                                      .GridViewprices[index],
                                                  style: TextStyles.MontserratSemiBold2,
                                                ),
                                                SizedBox(height: 5),
                                                FlutterRating(
                                                  rating: 4.5,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  size: 15,
                                                  borderColor: Colors.amber,
                                                  allowHalfRating: true,
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
