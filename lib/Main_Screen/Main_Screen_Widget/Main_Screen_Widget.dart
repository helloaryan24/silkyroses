import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../All_Custom_Faction/All_Widget.dart';
import '../../All_Custom_Faction/Colors.dart';
import '../../All_Custom_Faction/Image.dart';
import '../../All_Custom_Faction/TextStyle.dart';
import '../../Controller/Home_Controller.dart';

class CustomCarouselSlider extends StatelessWidget {
  final int current;
  final Function(int) onPageChanged;

  const CustomCarouselSlider({
    required this.current,
    required this.onPageChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          viewportFraction: 1,
          onPageChanged: (index, reason) => onPageChanged(index),
        ),
        items: imageAssetPaths.map((assetPath) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.darken),
                image: AssetImage(assetPath),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Get Special offer", style: TextStyles.Merribold5),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Up to 20%", style: TextStyles.MerriRegular1),
                  SizedBox(
                    height: 30,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 0, right: 150),
                  //   child: CustomButton(
                  //     backgroundColor: AppColors.contcolor,
                  //     onTap: () {
                  //       // loginController.signindone();
                  //     },
                  //     text: 'Order Now',
                  //     style: TextStyles.Merribold1,
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}


