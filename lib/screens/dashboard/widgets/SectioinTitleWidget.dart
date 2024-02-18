import 'package:flutter/material.dart';
import 'package:get/get.dart';


///Section title widget
class SectionTitleWidget extends StatelessWidget {
  ///Constructor
  const SectionTitleWidget({Key? key, required this.title, this.textSize = 30, required this.isWeb}) : super(key: key);

  ///Title text
  final String title;
  final double textSize;
  final bool isWeb;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: isWeb? 300 : 200,
      height: 60,
      child: Text(title.tr,style: Get.textTheme.bodySmall!.copyWith(fontSize: textSize,fontWeight: FontWeight.w600),),
      decoration: BoxDecoration(border: Border.all(color: Get.theme.primaryColorDark,width: 5)),
    );
  }
}
