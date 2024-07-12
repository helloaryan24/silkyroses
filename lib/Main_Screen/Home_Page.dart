import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../Controller/Home_Controller.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../All_Custom_Faction/Size.dart';
import '../ZoomDrawer/MenuScreen.dart';
import 'Main_Screen_Widget/Main_Screen_Widget.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  late TextEditingController _textEditingController;
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
  late FocusNode _focusNode;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _textEditingController.text = val.recognizedWords;
            _text = val.recognizedWords;
          }),
        );
        // Stop listening after 5 seconds
        Timer(Duration(seconds: 5), () {
          if (_isListening) {
            _stopListening();
          }
        });
      }
    } else {
      _stopListening();
    }
  }

  void _stopListening() {
    _speech.stop();
    setState(() => _isListening = false);
    _navigateToNextScreen(context); // Automatically navigate after stopping
  }

  void _navigateToNextScreen(BuildContext context) {
    _focusNode.unfocus(); // Close the keyboard
    if (_text.isNotEmpty) {
      // Example of using named route if configured in your app
      // Get.toNamed('/speechTextScreen', arguments: _text);
    } else {
      print("No recognized words to navigate.");
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _current = index;
    });
  }

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.contcolor2,
        body: Container(
          width: screenSize.width,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      child: TextField(
                        controller: _textEditingController,
                        focusNode: _focusNode,
                        cursorColor: AppColors.blackcolor,
                        onChanged: (String value) {
                          _text = value;
                        },
                        onSubmitted: (String value) {
                          _navigateToNextScreen(context);
                        },
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'MontserratMedium',
                        ),
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: AppColors.blackcolor.withOpacity(0.8),
                            ),
                          ),
                          suffixIcon: AvatarGlow(
                            animate: _isListening,
                            glowColor: Colors.red,
                            endRadius: 25.0,
                            duration: Duration(milliseconds: 1000),
                            repeatPauseDuration: Duration(milliseconds: 500),
                            repeat: true,
                            child: InkWell(
                              onTap: _listen,
                              child: Image.asset(
                                Images.imgmic,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: AppColors.whitecolor,
                          border: InputBorder.none,
                          hintText: "Search here...",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontFamily: 'MontserratRegular',
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
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Special Offer",
                            style: TextStyles.MontserratSemiBold1),
                        Text("View all", style: TextStyles.MontserratBold4),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomCarouselSlider(
                    current: _current,
                    onPageChanged: _onPageChanged,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Categories",
                            style: TextStyles.MontserratSemiBold1),
                        GestureDetector(
                            onTap: () {
                              controller.gotoProductsPage();
                            },
                            child: Text("View all",
                                style: TextStyles.MontserratBold4)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Container(
                      height: 130,
                      color: Colors.transparent,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.imagelisturl.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.imgbgcolor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 1,
                                            spreadRadius: 1),
                                      ],
                                      border: Border.all(
                                          width: 0.1,
                                          color: AppColors.contcolor)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40.0),
                                      child: Image.asset(
                                        controller.imagelisturl[index],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(controller.interests[index],
                                    style: TextStyles.MontserratMedium3),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Trends & Popular now",
                            style: TextStyles.MontserratSemiBold1),
                        GestureDetector(
                            onTap: () {
                              controller.gotoProductsPage();
                            },
                            child: Text("View all",
                                style: TextStyles.MontserratBold4)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 225,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.imagelisturl.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed('/products_details');
                            },
                            child: Container(
                              width: 140,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 120,
                                    alignment: Alignment.bottomRight,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image:
                                            AssetImage(Images.homelistroseimg),
                                      ),
                                    ),
                                    child: SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.favorite,
                                          size: 18,
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
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Text(
                                      'Bouquet “Autumn"',
                                      style: TextStyles.MontserratSemiBold,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("₹ 150 ",
                                            style:
                                                TextStyles.MontserratSemiBold2),
                                        Row(
                                          children: [
                                            Text('(243)',
                                                style:
                                                    TextStyles.MontserratBold9),
                                            Icon(Icons.star,
                                                color: Colors.amber, size: 18),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5,right: 5),
                                    child: CustomButton6(
                                        text: "Add to cart",
                                        backgroundColor:
                                            AppColors.contcolor.withOpacity(0.3),
                                        onTap: () {},
                                        style: TextStyles.MontserratBold10),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Halloween theme",
                            style: TextStyles.MontserratSemiBold1),
                        GestureDetector(
                            onTap: () {
                              controller.gotoProductsPage();
                            },
                            child: Text("View all",
                                style: TextStyles.MontserratBold4)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 225,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.imagelisturl.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed('/products_details');
                            },
                            child: Container(
                              width: 140,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 120,
                                    alignment: Alignment.bottomRight,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image:
                                        AssetImage(Images.homelistroseimg),
                                      ),
                                    ),
                                    child: SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.favorite,
                                          size: 18,
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
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Text(
                                      'Bouquet “Autumn"',
                                      style: TextStyles.MontserratSemiBold,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("₹ 150 ",
                                            style:
                                            TextStyles.MontserratSemiBold2),
                                        Row(
                                          children: [
                                            Text('(243)',
                                                style:
                                                TextStyles.MontserratBold9),
                                            Icon(Icons.star,
                                                color: Colors.amber, size: 18),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5,right: 5),
                                    child: CustomButton6(
                                        text: "Add to cart",
                                        backgroundColor:
                                        AppColors.contcolor.withOpacity(0.3),
                                        onTap: () {},
                                        style: TextStyles.MontserratBold10),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Halloween theme",
                            style: TextStyles.MontserratSemiBold1),
                        GestureDetector(
                            onTap: () {
                              controller.gotoProductsPage();
                            },
                            child: Text("View all",
                                style: TextStyles.MontserratBold4)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 225,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.imagelisturl.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed('/products_details');
                            },
                            child: Container(
                              width: 140,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 120,
                                    alignment: Alignment.bottomRight,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image:
                                        AssetImage(Images.homelistroseimg),
                                      ),
                                    ),
                                    child: SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Icon(
                                          Icons.favorite,
                                          size: 18,
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
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Text(
                                      'Bouquet “Autumn"',
                                      style: TextStyles.MontserratSemiBold,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("₹ 150 ",
                                            style:
                                            TextStyles.MontserratSemiBold2),
                                        Row(
                                          children: [
                                            Text('(243)',
                                                style:
                                                TextStyles.MontserratBold9),
                                            Icon(Icons.star,
                                                color: Colors.amber, size: 18),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5,right: 5),
                                    child: CustomButton6(
                                        text: "Add to cart",
                                        backgroundColor:
                                        AppColors.contcolor.withOpacity(0.3),
                                        onTap: () {},
                                        style: TextStyles.MontserratBold10),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// import 'dart:async';
// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
// import 'package:get/get.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
//
// import '../All_Custom_Faction/All_Widget.dart';
// import '../All_Custom_Faction/Colors.dart';
// import '../All_Custom_Faction/Image.dart';
// import '../Controller/Home_Controller.dart';
// import '../All_Custom_Faction/TextStyle.dart';
// import '../All_Custom_Faction/Size.dart';
// import '../ZoomDrawer/MenuScreen.dart';
// import 'Main_Screen_Widget/Main_Screen_Widget.dart';
//
// class Home_Page extends StatefulWidget {
//   const Home_Page({Key? key}) : super(key: key);
//
//   @override
//   State<Home_Page> createState() => _Home_PageState();
// }
//
// class _Home_PageState extends State<Home_Page> {
//   late TextEditingController _textEditingController;
//   late stt.SpeechToText _speech;
//   bool _isListening = false;
//   String _text = '';
//   late FocusNode _focusNode;
//
//   final HomeController controller = Get.put(HomeController());
//   final ZoomDrawerController _zoomDrawerController = ZoomDrawerController();
//
//   @override
//   void initState() {
//     super.initState();
//     _speech = stt.SpeechToText();
//     _textEditingController = TextEditingController();
//     _focusNode = FocusNode();
//   }
//
//   @override
//   void dispose() {
//     _textEditingController.dispose();
//     _focusNode.dispose();
//     super.dispose();
//   }
//
//   void _listen() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize(
//         onStatus: (val) => print('onStatus: $val'),
//         onError: (val) => print('onError: $val'),
//       );
//       if (available) {
//         setState(() => _isListening = true);
//         _speech.listen(
//           onResult: (val) => setState(() {
//             _textEditingController.text = val.recognizedWords;
//             _text = val.recognizedWords;
//           }),
//         );
//         Timer(Duration(seconds: 5), _stopListening);
//       }
//     } else {
//       _stopListening();
//     }
//   }
//
//   void _stopListening() {
//     _speech.stop();
//     setState(() => _isListening = false);
//     _navigateToNextScreen(context);
//   }
//
//   void _navigateToNextScreen(BuildContext context) {
//     _focusNode.unfocus();
//     if (_text.isNotEmpty) {
//       print("Recognized words: $_text");
//     } else {
//       print("No recognized words to navigate.");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = ScreenSize(context);
//
//     return ZoomDrawer(
//       controller: _zoomDrawerController,
//       style: DrawerStyle.Style1,
//       menuScreen: MenuScreen(),
//       borderRadius: 24.0,
//       showShadow: true,
//       angle: -5.0,
//       slideWidth: MediaQuery.of(context).size.width * .80,
//       shadowLayer1Color: AppColors.whitecolor.withOpacity(0.3),
//       shadowLayer2Color: AppColors.contcolor1.withOpacity(0.7),
//       openCurve: Curves.linear,
//       closeCurve: Curves.linearToEaseOut,
//       mainScreen: SafeArea(
//         child: Scaffold(
//           backgroundColor: AppColors.contcolor2,
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 30, bottom: 20),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10, right: 10),
//                     child: customAppbarhomescreen(context, () {
//                       _zoomDrawerController.toggle?.call();
//                     }),
//                   ),
//                   SizedBox(height: 30),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Container(
//                       height: 50,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                         border:
//                         Border.all(width: 2, color: AppColors.Dividercolor),
//                       ),
//                       child: TextField(
//                         controller: _textEditingController,
//                         focusNode: _focusNode,
//                         cursorColor: AppColors.blackcolor,
//                         onChanged: (String value) {
//                           _text = value;
//                         },
//                         onSubmitted: (String value) {
//                           _navigateToNextScreen(context);
//                         },
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontFamily: 'MerriweatherRegular',
//                         ),
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           contentPadding: const EdgeInsets.only(
//                               top: 11, bottom: 5, left: 15, right: 0),
//                           hintText: "Search here..",
//                           hintStyle: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 15,
//                             fontFamily: 'MerriweatherLight',
//                           ),
//                           prefixIcon: IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.search,
//                               color: AppColors.blackcolor.withOpacity(0.8),
//                             ),
//                           ),
//                           suffixIcon: AvatarGlow(
//                             animate: _isListening,
//                             glowColor: Colors.red,
//                             endRadius: 25.0,
//                             duration: Duration(milliseconds: 1000),
//                             repeatPauseDuration: Duration(milliseconds: 500),
//                             repeat: true,
//                             child: InkWell(
//                               onTap: _listen,
//                               child: Image.asset(
//                                 Images.imgmic,
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   SectionHeader(
//                     title: "Special Offer",
//                     onViewAll: () {},
//                   ),
//                   SizedBox(height: 10),
//                   CustomCarouselSlider(
//                     current: controller.current.value,
//                     onPageChanged: (index) => controller.updateCurrentIndex(index),
//                   ),
//                   SizedBox(height: 20),
//                   SectionHeader(
//                     title: "Categories",
//                     onViewAll: controller.gotoProductsPage,
//                   ),
//                   SizedBox(height: 10),
//                   HorizontalImageList(
//                     imagelisturl: controller.imagelisturl,
//                     interests: controller.interests,
//                   ),
//                   SizedBox(height: 20),
//                   SectionHeader(
//                     title: "Trends & Popular now",
//                     onViewAll: controller.gotoProductsPage,
//                   ),
//                   SizedBox(height: 10),
//                   ProductList(
//                     imagelisturl: controller.imagelisturl,
//                   ),
//                   SizedBox(height: 20),
//                   SectionHeader(
//                     title: "Halloween theme",
//                     onViewAll: controller.gotoProductsPage,
//                   ),
//                   SizedBox(height: 10),
//                   ProductList(
//                     imagelisturl: controller.imagelisturl,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SectionHeader extends StatelessWidget {
//   final String title;
//   final VoidCallback onViewAll;
//
//   const SectionHeader({
//     Key? key,
//     required this.title,
//     required this.onViewAll,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(title, style: TextStyles.Merriblack1),
//           GestureDetector(
//             onTap: onViewAll,
//             child: Text("View all", style: TextStyles.Merriblack2),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class HorizontalImageList extends StatelessWidget {
//   final List<String> imagelisturl;
//   final List<String> interests;
//
//   const HorizontalImageList({
//     Key? key,
//     required this.imagelisturl,
//     required this.interests,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 120,
//       width: double.infinity,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: imagelisturl.length,
//         itemBuilder: (context, index) {
//           return Row(
//             children: [
//               SizedBox(width: 20),
//               CustomContainer(
//                 imageUrl: imagelisturl[index],
//                 label: interests[index],
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// class ProductList extends StatelessWidget {
//   final List<String> imagelisturl;
//
//   const ProductList({
//     Key? key,
//     required this.imagelisturl,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 230,
//       width: double.infinity,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: imagelisturl.length,
//         itemBuilder: (context, index) {
//           return Row(
//             children: [
//               SizedBox(width: 20),
//               GestureDetector(
//                 onTap: () {
//                   Get.toNamed('/ProductDetails_Page');
//                 },
//                 child: Container(
//                   width: 200,
//                   decoration: BoxDecoration(
//                     color: AppColors.whitecolor,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       color: AppColors.blackcolor.withOpacity(0.2),
//                       width: 1.5,
//                     ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: 160,
//                         decoration: BoxDecoration(
//                           color: AppColors.contcolor1.withOpacity(0.1),
//                           borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
//                           child: Image.asset(
//                             imagelisturl[index],
//                             fit: BoxFit.fill,
//                             width: double.infinity,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           "Beautiful Red Rose",
//                           style: TextStyles.Merriblack3,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: Text(
//                           "\$100",
//                           style: TextStyles.MerriRegular1,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// class CustomCarouselSlider extends StatelessWidget {
//   final int current;
//   final Function(int index) onPageChanged;
//
//   const CustomCarouselSlider({
//     Key? key,
//     required this.current,
//     required this.onPageChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         height: 200,
//         autoPlay: true,
//         enlargeCenterPage: true,
//         viewportFraction: 0.8,
//         onPageChanged: (index, reason) => onPageChanged(index),
//       ),
//       items: List.generate(4, (index) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Container(
//               width: MediaQuery.of(context).size.width,
//               margin: EdgeInsets.symmetric(horizontal: 5.0),
//               decoration: BoxDecoration(
//                 color: Colors.amber,
//               ),
//               child: Image.asset(
//                 'assets/rose${index + 1}.png',
//                 fit: BoxFit.cover,
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }
//
// class CustomContainer extends StatelessWidget {
//   final String imageUrl;
//   final String label;
//
//   const CustomContainer({
//     Key? key,
//     required this.imageUrl,
//     required this.label,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 120,
//       decoration: BoxDecoration(
//         color: AppColors.whitecolor,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: AppColors.blackcolor.withOpacity(0.2),
//           width: 1.5,
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: 80,
//             width: 80,
//             decoration: BoxDecoration(
//               color: AppColors.contcolor1.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.asset(
//                 imageUrl,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             label,
//             style: TextStyles.Merriblack3,
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }
