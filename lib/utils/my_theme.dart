import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLightColor = Colors.green;
  static Color whiteColor = Colors.white;
  static Color redcolor = Colors.red;
  static Color darkBlueColor = Colors.blue;
  static Color pinkColor = Colors.pink;
  static Color brownColor = Colors.brown;
  static Color blueColor = Colors.blueAccent;
  static Color yellowColor = Colors.yellow;
  static Color greyColor = Colors.grey;
  static Color blackColor = Colors.black;

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLightColor,

    ///* AppBarTheme
    appBarTheme: AppBarTheme(
      color: primaryLightColor,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    ),

    ///* ProgressIndicatorThemeData
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: MyTheme.primaryLightColor,
    ),

    ///* TextTheme
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: blackColor,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        color: greyColor,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
