import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/fonts.dart';
import 'package:flutter/material.dart';

class XStyle {
  static TextTheme textTheme() => const TextTheme(
      headlineSmall: TextStyle(
          fontFamily: "Metropolis",
          color: MyColors.colorGray,
          fontSize: 18,
          fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
          fontFamily: "Metropolis", color: MyColors.colorGray, fontSize: 18),
      labelMedium: TextStyle(
          fontFamily: "Metropolis", color: MyColors.colorWhite, fontSize: 14),
      headlineMedium: TextStyle(
          fontFamily: "Metropolis",
          color: MyColors.colorBlack,
          fontSize: 34,
          fontWeight: FontWeight.w700));
}

class XStyleSign {
  static TextTheme textTheme() => const TextTheme(
        headline1: TextStyle(
          fontWeight: FontWeight.bold,
          color: MyColors.colorBlack,
          fontSize: 34,
          fontFamily: XFonts.metropolis,
        ),
        headline2: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          fontFamily: XFonts.metropolis,
        ),
        headline3: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          fontFamily: XFonts.metropolis,
        ),
        headline4: TextStyle(
          fontWeight: FontWeight.w500,
          height: 0.5,
          color: MyColors.colorGray,
          fontSize: 14,
          fontFamily: XFonts.metropolis,
        ),
        headline5: TextStyle(
          fontWeight: FontWeight.w500,
          color: MyColors.colorInputTextFormField,
          fontSize: 14,
          fontFamily: XFonts.metropolis,
        ),
        headline6: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          fontFamily: XFonts.metropolis,
        ),
        bodyText1: TextStyle(
          fontWeight: FontWeight.w500,
          color: MyColors.colorBlack,
          fontSize: 14,
          fontFamily: XFonts.metropolis,
        ),
      );
}
