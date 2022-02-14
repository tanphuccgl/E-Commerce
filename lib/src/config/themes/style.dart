import 'package:e_commerce/src/constants/my_colors.dart';
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
