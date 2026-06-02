import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import '../controller/home_controller.dart';

///Top menu items class
class MenuItemsMobile extends StatelessWidget {
  ///Top menu items class constructor
  MenuItemsMobile({Key? key}) : super(key: key);

  HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _homeController.menuNames.asMap().entries.map((entry) {
          final index = entry.key;
          final name = entry.value;
          return _text(name, index);
        }).toList(),
      ),
    ).paddingOnly(top: kToolbarHeight);
  }

  Widget _text(String e, int index) {
    return InkWell(
      onTap: () {
        Get.back(); // Close the menu first

        // Calculate scroll position based on section index
        // You'll need to get the position of each section
        switch (index) {
          case 0:
            _homeController.scrollToSection(aboutSectionKey);
            break;
          case 1:
            _homeController.scrollToSection(skillSectionKey);
            break;
          case 2:
            _homeController.scrollToSection(portfolioSectionKey);
            break;
          case 3:
            _homeController.scrollToSection(contactSectionKey);
            break;
        }
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        width: Get.width,
        decoration: BoxDecoration(
          color: e == _homeController.menuNames.last ? Colors.white : Colors.transparent,
        ),
        child: e == _homeController.menuNames.last
            ? Text(
          e,
          style: Get.textTheme.bodyMedium?.copyWith(
            color: Get.theme.primaryColorDark,
          ),
        )
            : Text(
          e,
          style: Get.textTheme.bodyMedium?.copyWith(
            color: Get.theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}