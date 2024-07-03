
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionBadgeWidget.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

// Import your custom color and text style definitions
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Main_Screen/Cart_Page.dart';
import '../Main_Screen/Home_Page.dart';
import '../Inside_Page/Products_Page.dart';
import '../Main_Screen/Profile_Page.dart';
import '../Main_Screen/Search_Page.dart';

// Page imports

class BottomBar_Page extends StatefulWidget {
  const BottomBar_Page({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _BottomBar_PageState createState() => _BottomBar_PageState();
}

class _BottomBar_PageState extends State<BottomBar_Page>
    with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();

    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _motionTabBarController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: "Home",
        useSafeArea: true,
        labels: ["Home","Search",  "Cart", "Profile"],
        icons: [
          // Icons.storefront_outlined,
          CupertinoIcons.home,
          CupertinoIcons.search,
          CupertinoIcons.bag,
          Icons.person_outlined,
        ],
        tabSize: 40,
        tabBarHeight: 50,
        textStyle: TextStyles.MerriLight2,
        tabIconColor: AppColors.whitecolor,
        tabIconSize: 20.0,
        tabIconSelectedSize: 25.0,
        tabSelectedColor: AppColors.whitecolor,
        tabIconSelectedColor: AppColors.blackcolor,
        tabBarColor: AppColors.contcolor,
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _motionTabBarController,
        children: <Widget>[
          Home_Page(),
          SearchPage(),
          Cart_Page(),
          // Products_Page(),
          Profile_Page(),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}
