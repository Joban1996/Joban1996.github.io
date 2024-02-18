import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class TextFieldView extends StatelessWidget {
  const TextFieldView({Key? key, required this.appTextField, this.isHeight = true}) : super(key: key);

  final TextField appTextField;
  final bool isHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: isHeight?30:null,
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.primary,
        border: Border(
          left: BorderSide(width: 4),
          bottom: BorderSide(width: 4),
        ),
      ),
      child: appTextField,
    );
  }
}
