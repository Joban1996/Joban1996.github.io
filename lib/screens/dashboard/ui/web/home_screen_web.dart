import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/buttons.dart';
import '../../controller/home_controller.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/skew_container_top.dart';
import 'about_me.dart';
import 'contact.dart';
import 'portfolio.dart';
import 'skills.dart';

///Home screen for web
class HomeScreenWeb extends StatelessWidget {
  ///Home screen for web constructor
   HomeScreenWeb({Key? key}) : super(key: key);

  HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _homeController.myListController,
      child: Container(
        color: Get.theme.colorScheme.primary,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              height: Get.height,
              decoration: BoxDecoration(color: Get.theme.primaryColorDark),
              child: Row(
                children: [
                  ClipPath(
                    clipper: SkewCut(),
                    child: Container(
                      width: Get.width/2,
                      height: Get.height,
                      decoration: BoxDecoration(color: Get.theme.colorScheme.primary),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: Get.height*0.05,),
                            SizedBox(
                              height: 40,width: 40,
                                child: Image.asset('assets/icons/JS.png')),
                            SizedBox(height: Get.height*0.3,),
                            Text('Hi, I am'.tr,style: Get.textTheme.bodyLarge!.copyWith(fontSize: 20),),
                            SizedBox(height: Get.height*0.04,),
                            Text('Jobandeep Singh'.tr,style: Get.textTheme.bodyLarge!.copyWith(fontSize: 40),),
                            Text('Front-end Developer / Flutter'.tr,style: Get.textTheme.bodyLarge!.
                            copyWith(fontSize: 13,color: Get.theme.colorScheme.secondary),),
                            SizedBox(height: Get.height/8,),
                            Wrap(
                              children: [
                                socialMediaOptions('assets/icons/mail.svg'),
                                socialMediaOptions('assets/icons/github.svg'),
                                socialMediaOptions('assets/icons/linkedIn.svg')
                              ],
                            )
                          ],
                        ),
                      )
                    ),
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Row(
                          children: [
                            menuOptions('About me',Get.theme.primaryColorDark,Get.theme.colorScheme.onPrimary),
                            menuOptions('Skills',Get.theme.primaryColorDark,Get.theme.colorScheme.onPrimary),
                            menuOptions('Portfolio',Get.theme.primaryColorDark,Get.theme.colorScheme.onPrimary),
                            menuOptions('CONTACT ME',Get.theme.colorScheme.onPrimary,Get.theme.primaryColorDark)
                          ],
                        ).paddingAll(Get.height*0.05),
                      ),
                      //Expanded(child: Image.asset('assets/images/pic.png'))
                    ],
                  )
                ],
              )
            ),
            Container(
              width: Get.width,
              height: 150,
              decoration: BoxDecoration(color: Colors.black),
            ),
            AboutMe(),
            Skills(isWeb: true,),
            Portfolio(),
            Contact()
          ],
        ),
      ),
    );
  }

  ///Social links
  Widget socialMediaOptions(String img){
    return Card(
      elevation: 1,
      child: Container(
        height: 38,
        width: 38,
        decoration: BoxDecoration(color: Get.theme.colorScheme.onSecondary),
        child: SvgPicture.asset(img).paddingAll(7),
      ),
    ).paddingOnly(right: Get.width*0.01);
  }

  ///Menu options mentioned on top the screen
  Widget menuOptions(String text,Color backGroundColor,Color textColor){
    //    return FilledButtonType2(text: Text(text.tr,style: Get.textTheme.bodySmall!.copyWith(color: Get.theme.colorScheme.onPrimary),), onPress: onPress);
    return FilledButtonType2(
        isEnabled: true,
        height: 35,
        enabledBackgroundColor: backGroundColor,
        enabledTextStyle: Get.textTheme.bodySmall!.copyWith(color: textColor,fontSize: 16),
        text: text.tr, onPress: (){

    }).paddingOnly(right: Get.width*0.02);
  }
}
