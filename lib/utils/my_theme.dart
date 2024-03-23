import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLightColor = const Color(0xff39A552);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color redcolor = const Color(0xffC91C22);
  static Color darkBlueColor = const Color(0xff003E90);
  static Color pinkColor = const Color(0xffED1E79);
  static Color brownColor = const Color(0xffCF7E48);
  static Color blueColor = const Color(0xff4882CF);
  static Color yellowColor = const Color(0xffF2D352);
  static Color greyColor = const Color(0xff79828B);
  static Color darkGreyColor = const Color(0xff42505C);
  static Color blackColor = const Color(0xff303030);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryLightColor,

    ///* AppBarTheme
    appBarTheme: AppBarTheme(
      foregroundColor: whiteColor,
      color: primaryLightColor,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
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
        fontFamily: 'Exo',
        color: whiteColor,
        fontSize: 22,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Exo',
        color: primaryLightColor,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        color: darkGreyColor,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        color: darkGreyColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        color: greyColor,
        fontSize: 12,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Poppins',
        color: darkGreyColor,
        fontWeight: FontWeight.w300,
        fontSize: 13,
      ),
    ),
  );
}
