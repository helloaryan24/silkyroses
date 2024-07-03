import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../All_Custom_Faction/Image.dart';

class Search_Controller extends GetxController {
  late stt.SpeechToText _speech;
  var isListening = false.obs;
  var text = ''.obs;
  var current = 0.obs;
  var textController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    _speech = stt.SpeechToText();
  }

  @override
  void onClose() {
    textController.value.dispose();
    super.onClose();
  }



  var imageGridViewurl = [
    Images.homelistroseimg,
    Images.homelistroseimg,
    Images.homelistroseimg,
    Images.homelistroseimg,
    Images.homelistroseimg,
    Images.homelistroseimg,
    Images.homelistroseimg,
  ];

  var GridViewNames = [
    "Bouquet “Autumn",
    "Bouquet “Autumn",
    "Bouquet “Autumn",
    "Bouquet “Autumn",
    "Bouquet “Autumn",
    "Bouquet “Autumn",
    "Bouquet “Autumn",
  ].obs;

  var GridViewprices = [
    "₹ 150",
    "₹ 140",
    "₹ 120",
    "₹ 110",
    "₹ 180",
    "₹ 100",
    "₹ 130",
    "₹ 160",
  ].obs;

  var iconFilledState = List<bool>.filled(7, false).obs;  // New list to track icon state
  var itemsInCart = List<bool>.filled(7, false).obs;      // New list to track cart state

  // Existing methods...

  void toggleIconState(int index) {
    iconFilledState[index] = !iconFilledState[index];
    itemsInCart[index] = !itemsInCart[index];
  }


  void listen() async {
    if (!isListening.value) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        isListening.value = true;
        _speech.listen(
          onResult: (val) {
            textController.value.text = val.recognizedWords;
            text.value = val.recognizedWords;
          },
        );
        Timer(Duration(seconds: 5), () {
          if (isListening.value) {
            stopListening();
          }
        });
      }
    } else {
      stopListening();
    }
  }

  void stopListening() {
    _speech.stop();
    isListening.value = false;
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    if (text.value.isNotEmpty) {
      // Navigate to the next screen with the recognized text
      // Get.toNamed('/speechTextScreen', arguments: text.value);
    } else {
      print("No recognized words to navigate.");
    }
  }

  void onPageChanged(int index) {
    current.value = index;
  }

  void navigateToprodutspage() {
    Get.toNamed('/products_details'); // Navigate to forget password page
  }




}
