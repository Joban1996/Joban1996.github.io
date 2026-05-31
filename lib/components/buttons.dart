import 'package:get/get.dart';

import 'extension.dart';
import 'package:flutter/material.dart';

class FilledButtonType1 extends StatelessWidget {
  final String? text;
  final double? height;
  final double? width;
  final double? cornerRadius;
  final bool? isEnabled;
  final double? letterSpacing;
  final Color? textColor;
  final Widget? leading;
  final Widget? trailing;
  final Color? enabledBackgroundColor;
  final Color? disabledBackgroundColor;

  final TextStyle? enabledTextStyle;
  final TextStyle? disabledTextStyle;

  final VoidCallback? onPress;

  const FilledButtonType1({
    Key? key,
    required this.text,
    required this.onPress,
    this.height,
    this.width,
    this.cornerRadius,
    this.leading,
    this.trailing,
    this.letterSpacing,
    this.textColor,
    this.enabledBackgroundColor,
    this.disabledBackgroundColor,
    this.enabledTextStyle,
    this.disabledTextStyle,
    this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 50,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor,
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? 15)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(1, 1),
            blurRadius: cornerRadius ?? 15,
            color: Theme.of(context).shadowColor.withOpacity(0.2),
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leading != null) leading!,
          Center(
            child: Text(
              text!,
              style: isEnabled == true
                  ? enabledTextStyle ??
                  Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      letterSpacing: letterSpacing ?? 0.5,
                      color: textColor ?? Colors.white)
                  : disabledTextStyle ??
                  Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      letterSpacing: letterSpacing ?? 0.5,
                      color: textColor ?? Colors.white),
            ),
          ),
          trailing != null ? trailing!: Container()
        ],
      ),
    ).ripple(() {
      isEnabled == false ? null : onPress!();
    });
  }
}

class BorderButtonType1 extends StatelessWidget {
  final String? text;
  final VoidCallback? onPress;
  final Color? borderColor;
  final double? letterSpacing;
  final Color? textColor;
  final Color? backgroundColor;
  final double? height;
  final double? cornerRadius;
  final TextStyle? textStyle;
  final double? width;

  const BorderButtonType1(
      {Key? key,
        required this.text,
        required this.onPress,
        this.height,
        this.width,
        this.letterSpacing,
        this.textColor,
        this.cornerRadius,
        this.borderColor,
        this.backgroundColor,
        this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width ?? double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
            width: 1,
            color: borderColor ??
                Theme.of(context).dividerColor),
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? 15)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(1, 1),
            blurRadius: cornerRadius ?? 15,
            color: Theme.of(context).shadowColor.withOpacity(0.2),
          ),
        ],
      ),

      height: height ?? 50,
      // color: backgroundColor,
      child: Center(
        child: Text(
          text!,
          style: textStyle ??
              Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                  letterSpacing: letterSpacing ?? 0.5,
                  color: textColor ?? Colors.black),
        ),
      ),
    ).ripple(onPress!);
  }
}

class TextButtonType1 extends StatelessWidget {
  final String? text;
  final VoidCallback? onPress;
  final double? letterSpacing;
  final Color? textColor;
  final double? height;
  final TextStyle? textStyle;
  final double? width;

  const TextButtonType1(
      {Key? key,
        required this.text,
        required this.onPress,
        this.height,
        this.width,
        this.letterSpacing,
        this.textColor,
        this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: Text(text!,
            style: textStyle ?? Theme.of(context).textTheme.bodyLarge));
  }
}

class FilledButtonType2 extends StatelessWidget {
  final String? text;
  final double? height;
  final double? width;
  final double? cornerRadius;
  final bool? isEnabled;
  final double? letterSpacing;
  final Color? textColor;
  final Widget? leading;
  final Widget? trailing;
  final Color? enabledBackgroundColor;
  final Color? disabledBackgroundColor;

  final TextStyle? enabledTextStyle;
  final TextStyle? disabledTextStyle;

  final VoidCallback? onPress;

  const FilledButtonType2({
    Key? key,
    required this.text,
    required this.onPress,
    this.height,
    this.width,
    this.cornerRadius,
    this.leading,
    this.trailing,
    this.letterSpacing,
    this.textColor,
    this.enabledBackgroundColor,
    this.disabledBackgroundColor,
    this.enabledTextStyle,
    this.disabledTextStyle,
    this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 50,
      decoration: BoxDecoration(
        color: enabledBackgroundColor ?? Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? 20)),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leading != null) leading!,
          Center(
            child: Text(
              text!,
              style: isEnabled == true
                  ? enabledTextStyle ??
                  Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: letterSpacing ?? 0.5,
                      color: textColor ?? Colors.white)
                  : disabledTextStyle ??
                  Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: letterSpacing ?? 0.5,
                      color: textColor ?? Colors.white),
            ),
          ),
        ],
      ).paddingOnly(right: Get.width*0.01,left: Get.width*0.01),
    ).ripple(() {
      isEnabled == false ? null : onPress!();
    });
  }
}
