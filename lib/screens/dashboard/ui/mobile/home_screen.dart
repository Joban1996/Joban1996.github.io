import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';
import '../../controller/home_controller.dart';
import '../../utils/skew_container.dart';
import '../../widgets/menu_items_mobile.dart';
import '../web/contact.dart';
import '../web/portfolio.dart';
import '../web/skills.dart';
import 'about_me_mobile.dart';

///Home screen for mobile
class HomeScreenMobile extends StatelessWidget {
  ///Home screen for mobile constructor
  HomeScreenMobile({Key? key}) : super(key: key);

  HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenHeight = Get.height;
    final screenWidth = Get.width;

    return SingleChildScrollView(
      controller: _homeController.myListController,
      child: Container(
        color: Get.theme.colorScheme.primary,
        child: Column(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth,
              color: Get.theme.primaryColorDark,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.asset(
                              'assets/icons/JS.png',
                              color: Get.theme.colorScheme.primary,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await showTopModalSheet<String?>(
                                context,
                                MenuItemsMobile(),
                                backgroundColor: Colors.transparent,
                              );
                            },
                            child: Icon(
                              Icons.menu,
                              color: Get.theme.colorScheme.primary,
                              size: 40,
                            ),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: screenWidth * 0.03, vertical: 16),
                    ],
                  ),

                  // ✅ Profile Photo on Mobile
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/mypic.jpeg',
                          fit: BoxFit.cover,
                          width: 180,
                          height: 180,
                          errorBuilder: (_, __, ___) => Container(
                            color: Colors.grey.shade300,
                            child: const Icon(
                              Icons.person,
                              size: 80,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Bottom text section
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipPath(
                      clipper: SkewCutTop(),
                      child: Container(
                        height: 280,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          color: Get.theme.colorScheme.onPrimary.withOpacity(0.2),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hi, I am'.tr,
                                    style: Get.textTheme.bodyLarge!.copyWith(
                                      fontSize: 20,
                                      color: Get.theme.colorScheme.onPrimary,
                                    ),
                                  ),
                                  Text(
                                    'Jobandeep Singh'.tr,
                                    style: Get.textTheme.bodyLarge!.copyWith(
                                      fontSize: 30,
                                      color: Get.theme.colorScheme.onPrimary,
                                    ),
                                  ),
                                  Text(
                                    'Front-end Developer / Flutter'.tr,
                                    style: Get.textTheme.bodyLarge!.copyWith(
                                      fontSize: 12,
                                      color: Get.theme.colorScheme.onPrimary,
                                    ),
                                  ),
                                ],
                              ).paddingOnly(bottom: screenHeight * 0.03),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                socialMediaOptions('assets/icons/mail.svg'),
                                socialMediaOptions('assets/icons/github.svg'),
                                socialMediaOptions('assets/icons/linkedIn.svg'),
                              ],
                            ),
                          ],
                        ).paddingSymmetric(horizontal: screenWidth * 0.07, vertical: screenHeight * 0.02),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ❌ REMOVE THE BLACK CONTAINER
            // Container(
            //   width: screenWidth,
            //   height: 150,
            //   decoration: BoxDecoration(color: Colors.black),
            // ),

            // Sections
            AboutMeMobile(),
            Skills(isWeb: false),
            Portfolio(),
            Contact(),
          ],
        ),
      ),
    );
  }

  Widget socialMediaOptions(String img) {
    return Card(
      elevation: 1,
      child: Container(
        height: 38,
        width: 38,
        decoration: BoxDecoration(color: Get.theme.colorScheme.onSecondary),
        child: SvgPicture.asset(img).paddingAll(7),
      ),
    ).paddingOnly(bottom: Get.height * 0.03);
  }
}