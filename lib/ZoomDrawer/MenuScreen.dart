import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/TextStyle.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.contcolor.withOpacity(0.9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Menu',
                  style: TextStyles.Merribold2,
                ),
              ),
              _buildMenuItem(
                context,
                icon: Icons.person_2_rounded,
                text: 'Profile',
              ),
              _buildMenuItem(
                context,
                icon: Icons.shopping_bag,
                text: 'My Orders',
              ),
              _buildMenuItem(
                context,
                icon: Icons.event_note,
                text: 'My History',
              ),
              _buildMenuItem(
                context,
                icon: Icons.shopping_cart,
                text: 'My Cart',
              ),
              _buildMenuItem(
                context,
                icon: Icons.local_offer,
                text: 'Offer and promo',
              ),

              Divider(color: Colors.white),
              _buildMenuItem(
                context,
                icon: Icons.logout,
                text: 'Log Out',
                isLogout: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon, required String text, bool isLogout = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: GestureDetector(
        onTap: () {
          // Navigate to different pages based on the menu item tapped
          switch (text) {
            case 'My Orders':
              // Get.toNamed('/MyOrder_Page');
              break;
            case 'My History':
              // Get.toNamed('/MyHistory_Page');
              break;
            case 'My Cart':
              // Get.toNamed('/MyCart_Page');
              break;
            case 'Offer and promo':
              // Get.toNamed('/Offer_Promo_Page');
              break;
            case 'Profile':
              // Get.toNamed('/MyProfile_Page');
              break;
            case 'Log Out':
            // Implement logout functionality
              break;
            default:
              break;
          }
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyles.MerriLight1,
            ),
          ],
        ),
      ),
    );
  }
}
