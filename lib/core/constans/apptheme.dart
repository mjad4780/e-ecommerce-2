import 'package:flutter/material.dart';
import 'package:untitled/my%20core/resources/color_manager.dart';

ThemeData themeEnglish = ThemeData(
    fontFamily: "PlayfairDisplay",
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: ColorManager.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: ColorManager.black),
      // bodyText1: TextStyle(
      //     height: 2,
      //     color: ColorManager.grey,
      //     fontWeight: FontWeight.bold,
      //     fontSize: 14),
      //     bodyMedium: TextStyle(height: 2, color: ColorManager.grey, fontSize: 14)),
      // primarySwatch: Colors.blue,
    ));

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: ColorManager.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: ColorManager.black),
      // bodyText1: TextStyle(
      //     height: 2,
      //     color: ColorManager.grey,
      //     fontWeight: FontWeight.bold,
      //     fontSize: 14)
      // ,
      bodyMedium: TextStyle(height: 2, color: Colors.grey, fontSize: 14)),
);
