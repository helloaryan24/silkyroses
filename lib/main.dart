import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'All_Custom_Faction/AppRoutes.dart';
import 'All_Custom_Faction/Colors.dart';
import 'Api_Format/Api_services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.whitecolor,
    systemNavigationBarColor: AppColors.blackcolor,
  ));

  Get.put(AllApiFaction()); // Register AllApiFaction instance

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.routes,
    );
  }
}
