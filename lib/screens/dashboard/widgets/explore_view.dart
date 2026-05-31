import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Explore button
class Explore extends StatelessWidget {
  /// Explore button constructor
  const Explore({Key? key, this.textSize = 15, this.viewWidth}) : super(key: key);

  final double textSize;
  final double? viewWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: viewWidth??Get.width*0.08,
      height: 25,
      child: Text('EXPLORE'.tr,style: Get.textTheme.bodySmall!.copyWith(fontSize: textSize,fontWeight: FontWeight.w500),),
      decoration: BoxDecoration(
          color: Get.theme.colorScheme.primary,
          border: Border(left: BorderSide(color: Get.theme.primaryColorDark,width: 2),
              right:  BorderSide(color: Get.theme.primaryColorDark,width: 2))),
    );
  }
}
