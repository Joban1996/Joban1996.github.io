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
        children: _homeController.menuNames.map(_text).toList(),
      ),
    ).paddingOnly(top: kToolbarHeight);
  }
  Widget _text(String e){
    return InkWell(
      onTap: (){
        Get.back();
        switch(_homeController.menuNames.indexOf(e)){
          case 0:
            Scrollable.ensureVisible(aboutSectionKey.currentContext!);
         break;
          case 1:
            Scrollable.ensureVisible(skillSectionKey.currentContext!);
         break;
          case 2:
            Scrollable.ensureVisible(portfolioSectionKey.currentContext!);
            break;
          case 3:
            Scrollable.ensureVisible(contactSectionKey.currentContext!);
            break;
        }
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        width: Get.width,
        decoration: BoxDecoration(color: e == _homeController.menuNames.last ? Colors.white : Colors.transparent),
        child:
        e == _homeController.menuNames.last ? Text(e,style: Get.textTheme.bodyMedium?.copyWith(color: Get.theme.primaryColorDark),):
        Text(e,style: Get.textTheme.bodyMedium?.copyWith(color: Get.theme.colorScheme.onPrimary),),),
    );
  }
}
