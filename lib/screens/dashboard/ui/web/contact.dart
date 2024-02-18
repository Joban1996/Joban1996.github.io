import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../widgets/SectioinTitleWidget.dart';
import '../../widgets/textFieldView.dart';



///Contact UI class
class Contact extends StatelessWidget {
  ///Contact UI class constructor
  Contact({Key? key}) : super(key: key);


  HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Get.height*0.1,),
        SectionTitleWidget(title: 'CONTACT',isWeb: true,),
        Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys '
            'standard dummy text ever since the 1500s, when an unknown printer too'
            'k a galley of type and scrambled it to make a type specimen book'.tr,
          style: Get.textTheme.bodySmall!.copyWith(fontSize: 12),textAlign: TextAlign.center,).
        paddingOnly(top: Get.height*0.06,bottom: Get.height*0.06,right: Get.width*0.2,left: Get.width*0.2),
        SizedBox(
            height: 70,
            width: 130,
            child: Image.asset('assets/icons/separator.png').paddingOnly(bottom: Get.height*0.06)),
        TextFieldView(appTextField: TextField(
          style: Get.textTheme.bodySmall!.copyWith(fontSize: 13,color: Get.theme.colorScheme.surface),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            hintText: 'ENTER YOUR NAME',
            hintStyle: Get.textTheme.bodySmall!.copyWith(fontSize: 13,color: Get.theme.colorScheme.surface),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        )).paddingOnly(bottom: Get.height*0.06,right: 16,left: 16),
        TextFieldView(appTextField: TextField(
          style: Get.textTheme.bodySmall!.copyWith(fontSize: 13,color: Get.theme.colorScheme.surface),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            hintText: 'ENTER YOUR EMAIL',
            hintStyle: Get.textTheme.bodySmall!.copyWith(fontSize: 13,color: Get.theme.colorScheme.surface),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        )).paddingOnly(bottom: Get.height*0.06,right: 16,left: 16),
        TextFieldView(appTextField: TextField(
          style: Get.textTheme.bodySmall!.copyWith(fontSize: 13,color: Get.theme.colorScheme.surface),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            hintText: 'PHONE NUMBER',
            hintStyle: Get.textTheme.bodySmall!.copyWith(fontSize: 13,color: Get.theme.colorScheme.surface),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        )).paddingOnly(bottom: Get.height*0.06,right: 16,left: 16),
        TextFieldView(
            isHeight: false,
            appTextField: TextField(
              maxLines: 4,
          style: Get.textTheme.bodySmall!.copyWith(fontSize: 13,color: Get.theme.colorScheme.surface),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            hintText: 'YOUR MESSAGE',
            hintStyle: Get.textTheme.bodySmall!.copyWith(fontSize: 13,color: Get.theme.colorScheme.surface),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        )).paddingOnly(right: 16,left: 16),
        submit().paddingOnly(top: Get.height*0.1,bottom: Get.height*0.1),
        Container(
          width: Get.width,
          height: 150,
          decoration: BoxDecoration(color: Colors.black),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             backToTopWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  svgCommon('assets/icons/facebook.svg'),
                  svgCommon('assets/icons/linkedIn_bottom.svg'),
                  svgCommon('assets/icons/instagram.svg'),
                  svgCommon('assets/icons/email.svg'),
                ],
              ),
              RichText(text: TextSpan(
                children: [
                  TextSpan(text: '@2024 Jobandeep Singh ',
                      style: Get.textTheme.bodyMedium!.copyWith(fontSize: 13,color: Get.theme.colorScheme.onPrimary)),
                  TextSpan(text: 'All Rights Reserved.',style: Get.textTheme.bodyMedium!.copyWith(fontSize: 13,color: Get.theme.colorScheme.onPrimary
                  ,fontWeight: FontWeight.w300))
                ]
              ))
            ],
          ).paddingAll(8),
        ),
      ],
    );
  }

  Widget backToTopWidget(){
    return InkWell(
      onTap: (){
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_homeController.myListController.hasClients) {
            _homeController.myListController.animateTo(0.0,duration: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,);
          }
        });
      },
      child: Column(
        children: [
          Icon(Icons.arrow_upward_rounded,color: Get.theme.colorScheme.onPrimary,),
          Text('BACK TO TOP',style: Get.textTheme.bodyMedium!.copyWith(fontSize: 13,color: Get.theme.colorScheme.onPrimary),),
        ],
      ),
    );
  }
  ///Svg common widget
  Widget svgCommon(String img){
    return SizedBox(
        height: 35,width: 35,
        child: SvgPicture.asset(img).paddingOnly(right: Get.width*0.01));
  }

  Widget submit(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          height: 25,
          child:
          Text('SUBMIT'.tr,style: Get.textTheme.bodySmall!.copyWith(fontSize: 15,fontWeight: FontWeight.w500),).paddingOnly(left: 16,right: 16),
          decoration: BoxDecoration(
              color: Get.theme.colorScheme.primary,
              border: Border(left: BorderSide(color: Get.theme.primaryColorDark,width: 2),
                  right:  BorderSide(color: Get.theme.primaryColorDark,width: 2))),
        ),
      ],
    );
  }
}
