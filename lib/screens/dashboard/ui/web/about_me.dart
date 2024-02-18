import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/SectioinTitleWidget.dart';
import '../../widgets/explore_view.dart';


///About me part of dashboard screen
class AboutMe extends StatelessWidget {
  ///Class constructor
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.colorScheme.primary,
      child: Column(
        children: [
          SizedBox(height: Get.height*0.1,),
          SectionTitleWidget(title: 'ABOUT ME',isWeb: true,),
          Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys '
              'standard dummy text ever since the 1500s, when an unknown printer too'
              'k a galley of type and scrambled it to make a type specimen book'.tr,
            style: Get.textTheme.bodySmall!.copyWith(fontSize: 12),textAlign: TextAlign.center,).
          paddingOnly(top: Get.height*0.06,bottom: Get.height*0.06),
          Explore(viewWidth: 130,).paddingOnly(top: Get.height*0.05,bottom: Get.height*0.06),
          SizedBox(
              height: 70,
              width: 130,
              child: Image.asset('assets/icons/separator.png').paddingOnly(bottom: Get.height*0.06)),
          Row(
            children: [
              Expanded(child: developMaintenance('DEVELOPMENT',
                  'I can design the site based on your needs and suggestions. '
                      'I can also design the site from scratch and consult you during the job.','assets/icons/develop.png')),
              SizedBox(width: Get.width*0.02,),
              Expanded(child: developMaintenance('MAINTENANCE','I can design the site based on your needs and suggestions. '
                  'I can also design the site from scratch and consult you during the job.','assets/icons/maintenance.png'))
            ],
          ).paddingOnly(bottom: Get.height*0.1),
          SizedBox(
              height: 90,
              width: 130,
              child: Image.asset('assets/icons/separator.png').paddingOnly(bottom: Get.height*0.1,)),
        ],
      ).paddingOnly(right: Get.width*0.2,left: Get.width*0.2),
    );
  }

  ///Develop and maintenance
  Widget developMaintenance(String text,String des,String img){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            SizedBox(
                height: 55,width: 55,
                child: Image.asset(img)),
            Text(text.tr,style: Get.textTheme.bodySmall!.copyWith(fontSize: 18,fontWeight: FontWeight.w600),).paddingOnly(
              left: Get.width*0.03
            )
          ],
        ),
        Text(des.tr
        ,style: Get.textTheme.bodySmall!.copyWith(fontSize: 12),)
      ],
    );
  }
}


