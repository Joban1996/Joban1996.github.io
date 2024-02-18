import 'package:flutter/material.dart';
import 'font_sizes.dart';
///App theme class for whole project
class AppTheme {

  static double iconSize = 20;

  static ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
        displayLarge: TextStyle(
            fontSize: FontSizes.displayL,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w600),
        displayMedium: TextStyle(
            fontSize: FontSizes.displayM,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w600),
        displaySmall: TextStyle(
            fontSize: FontSizes.displayS,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(
            fontSize: FontSizes.subTitle,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(
            fontSize: FontSizes.headlineM,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(
            fontSize: FontSizes.bodyL,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w700),
        bodyMedium: TextStyle(
            fontSize: FontSizes.bodyM,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w600),
        bodySmall: TextStyle(
            fontSize: FontSizes.bodyS,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w400),
        titleLarge: TextStyle(
            fontSize: FontSizes.titleL,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w600),
        titleMedium: TextStyle(
            fontSize: FontSizes.titleM,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w600),
        titleSmall: TextStyle(
            fontSize: FontSizes.titleS,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w600),
      ),
      //dividerColor: const Color(0xff747d8c),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFFD7D7D7),
          onPrimary: Color(0xFFFFFFFF),
          secondary: Color(0xFF909090),
          onSecondary: Color(0xFFC4C4C4),
          error: Color(0xFFD95E5A),
          onError: Color(0xFFD95E5A),
          background: Color(0xFFECAFAC),
          onBackground: Color(0xFFF7DFDE),
          surface:  Color(0xFF8B8B8B),
          onSurface: Color(0xFFFFECDA)
      ),
      fontFamily: 'Montserrat',
      brightness: Brightness.light,
      //hoverColor: const Color(0xff000000),
      primaryColor: const Color(0xFFD4F4E2),
      primaryColorDark: const Color(0xFF000000),
      primaryColorLight: const Color(0xFF29C770),
      shadowColor: const Color(0xFFC4C4C4),
      //iconTheme: const IconThemeData(color: Color(0xff37A1F9)),
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Color(0xFFFFFFFF),
      ),
      //cardColor: const Color(0xffffffff),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF017EFF),
        //disabledColor: Color(0xff808080),
      ));
}
