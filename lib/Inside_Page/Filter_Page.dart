import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Size.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/Filter_Controller.dart';

class Filter_Page extends StatelessWidget {
  final FilterController controller = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    final screenSize = ScreenSize(context);

    return Scaffold(
      backgroundColor: AppColors.contcolor3,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 10, right: 10, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Sort By",
                    style: TextStyles.MontserratSemiBold1,
                  ),
                  Divider(
                    height: 30,
                    color: AppColors.Dividercolor,
                  ),
                  _buildFilterOption('Price', controller.pricesOptions,
                      controller.pricesOptionsOption),
                  SizedBox(height: 30.0),
                  _buildFilterOption('Quantity', controller.quantityOptions,
                      controller.selectedQuantityOption),
                  SizedBox(height: 30.0),
                  _buildColorFilter(),
                  SizedBox(height: 30.0),
                  _buildFollowerTypeFilter(),
                  SizedBox(height: 30.0),
                  _buildCategoryFilter(),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                backgroundColor: AppColors.contcolor5,
                onTap: () {
                  controller.resetFilters();
                },
                text: 'Reset',
                style: TextStyles.MontserratBold12,
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: CustomButton1(
                backgroundColor: AppColors.whitecolor,
                onTap: () {
                  controller.applyFilters();
                  Get.back();
                },
                text: 'Apply',
                style: TextStyles.MontserratBold13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterOption(String title, List<String> options,
      RxString selectedOption) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: TextStyles.MontserratBold4),
        SizedBox(height: 8.0),
        Obx(() =>
            Wrap(
              spacing: 30,
              runSpacing: 5,
              children: options.map((option) {
                return FilterChip(
                  label: Text(option, style: TextStyles.MontserratBold4),
                  backgroundColor: Colors.white,
                  selected: selectedOption.value == option,
                  selectedColor: AppColors.contcolor5.withOpacity(0.2),
                  // Change color if selected
                  onSelected: (selected) {
                    selectedOption.value = selected ? option : '';
                    if (title == 'Quantity') {
                      controller.setQuantityOption(option);
                    }
                  },
                );
              }).toList(),
            )),
      ],
    );
  }

  Widget _buildColorFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Color',
          style: TextStyles.MontserratBold4,
        ),
        SizedBox(height: 8.0),
        Obx(() =>
            Wrap(
              spacing: 30,
              runSpacing: 5,
              children: controller.colorOptions.map((option) {
                // Color color = controller.colorMap[option] ?? Colors.grey; // Default to grey if color is not found
                return FilterChip(
                  backgroundColor: controller.colorMap[option]?.withOpacity(
                      0.5),
                  label: Text(option, style: TextStyles.MontserratBold4),
                  selected: controller.selectedColorOption.value == option,
                  selectedColor: controller.colorMap[option]?.withOpacity(0.5),
                  onSelected: (selected) {
                    controller.selectedColorOption.value =
                    selected ? option : '';
                  },
                );
              }).toList(),
            )),
      ],
    );
  }

  Widget _buildFollowerTypeFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Type of Followers',
          style: TextStyles.MontserratBold4,
        ),
        SizedBox(height: 8.0),
        Wrap(
          spacing: 30.0,
          runSpacing: 30.0,
          children: controller.followerTypeOptions.map((option) {
            return Obx(() =>
                GestureDetector(
                  onTap: () {
                    controller.selectedFollowerTypeOption.value =
                    option['name'];
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: controller.selectedFollowerTypeOption.value ==
                          option['name']
                          ? AppColors.contcolor5.withOpacity(
                          0.2) // Change color if selected
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            option['image'],
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            option['name'],
                            style: TextStyles.MontserratMedium3,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow
                                .visible, // Ensure text is fully shown
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCategoryFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Category',
          style: TextStyles.MontserratBold4,
        ),
        SizedBox(height: 8.0),
        Wrap(
          spacing: 30,
          runSpacing: 30,
          children: controller.categoryOptions.map((option) {
            return Obx(() =>
                GestureDetector(
                  onTap: () {
                    controller.selectedCategoryOption.value = option['name'];
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.selectedCategoryOption.value ==
                              option['name']
                              ? AppColors.contcolor5.withOpacity(
                              0.2) // Change color if selected
                              : AppColors.imgbgcolor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.0),
                            child: Image.asset(
                              option['image'],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(option['name'], style: TextStyles.MontserratMedium3),
                    ],
                  ),
                ));
          }).toList(),
        ),
      ],
    );
  }
}
