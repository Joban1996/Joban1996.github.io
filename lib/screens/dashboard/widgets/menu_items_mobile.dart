import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        children: _homeController.menuNames.map(Text.new).toList(),
      ),
    ).paddingOnly(top: kToolbarHeight);
  }
}
