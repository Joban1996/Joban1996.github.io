import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../components/buttons.dart';
import '../../../../main.dart';
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
                                    socialMediaOptions('assets/icons/mail.svg', 'mailto:your.email@gmail.com'),
                                    socialMediaOptions('assets/icons/github.svg', 'https://github.com/joban1996'),
                                    socialMediaOptions('assets/icons/linkedIn.svg', 'https://www.linkedin.com/in/jobandeep-singh-302771166/'),
                                  ],
                                )
                              ],
                            ),
                          )
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                menuOptions('About me', aboutSectionKey),
                                menuOptions('Skills', skillSectionKey),
                                menuOptions('Portfolio',portfolioSectionKey),
                                menuOptions('CONTACT ME',contactSectionKey),
                              ],
                            ).paddingAll(Get.height*0.05),
                          ),
                          Expanded(
                            child: Center(
                              child: _buildProfilePhoto(),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                )
            ),

            // ✅ REPLACED BLACK STRIP WITH BEAUTIFUL CURVED WAVE
            Container(
              width: Get.width,
              height: 80,
              child: CustomPaint(
                painter: WavePainter(),
                size: Size(Get.width, 80),
              ),
            ),

            // Sections
            Container(key: aboutSectionKey, child: AboutMe()),
            Container(key: skillSectionKey, child: Skills(isWeb: true)),
            Container(key: portfolioSectionKey, child: const Portfolio()),
            Container(key: contactSectionKey, child: const Contact()),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return Container(
      width: 250,
      height: 250,
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
          width: 250,
          height: 250,
          errorBuilder: (_, __, ___) => Container(
            color: Colors.grey.shade300,
            child: const Icon(
              Icons.person,
              size: 100,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget socialMediaOptions(String img, String url){
    return GestureDetector(
      onTap: () {
        // Use url_launcher to open the link
        launchUrl(Uri.parse(url));
      },
      child: Card(
        elevation: 1,
        child: Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(color: Get.theme.colorScheme.onSecondary),
          child: SvgPicture.asset(img).paddingAll(7),
        ),
      ).paddingOnly(right: Get.width*0.01),
    );
  }

  Widget menuOptions(String text, GlobalKey sectionKey) {
    return FilledButtonType2(
      isEnabled: true,
      height: 35,
      enabledBackgroundColor: Colors.transparent,
      enabledTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
      text: text.tr,
      onPress: () {
        _homeController.scrollToSection(sectionKey);
      },
    ).paddingOnly(right: Get.width * 0.02);
  }
}

// ✅ Custom Wave Painter for Beautiful Transition
class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.shade50
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.8, size.width * 0.5, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.75, 0, size.width, size.height * 0.6);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}