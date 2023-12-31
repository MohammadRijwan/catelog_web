import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

//#0d4d96 (correct blue color)
const colorPrimary = Colors.orange;
const colorAccent = Color.fromRGBO(255, 46, 0, 100);
const darkBackground = Color.fromRGBO(2, 15, 75, 100);
const lightBackground = Color.fromRGBO(245, 245, 245, 1);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: lightBackground,
  primaryColor: colorPrimary,
  cardColor: Colors.white,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: darkBackground, refreshBackgroundColor: Colors.transparent),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  textTheme: TextTheme(
    button: TextStyle(
      fontFamily: 'GOTHIC',
      fontSize: 15.sp,
      height: 1.6,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    bodyText2: TextStyle(
      fontFamily: 'GOTHIC',
      fontSize: 12.sp,
      color: const Color(0xff1B1D28),
      fontWeight: FontWeight.w500,
    ),
    bodyText1: TextStyle(
      fontFamily: 'GOTHIC',
      height: 1.6,
      fontSize: 12.sp,
      color: const Color(0xff7b7f9e),
      fontWeight: FontWeight.w400,
    ),
    headline2: TextStyle(
      fontFamily: 'GOTHIC',
      fontSize: 24.sp,
      color: const Color(0xff171822),
      fontWeight: FontWeight.w600,
    ),
    headline3: TextStyle(
      fontFamily: 'GOTHIC',
      fontSize: 22.sp,
      color: Colors.white,
      fontWeight: FontWeight.w800,
    ),
    headline4: TextStyle(
      fontFamily: 'GOTHIC',
      fontSize: 15.sp,
      color: const Color(0xff3A4276),
      fontWeight: FontWeight.w600,
    ),
    headline5: TextStyle(
      fontFamily: 'GOTHIC',
      fontSize: 22.sp,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    headline6: TextStyle(
      fontFamily: 'GOTHIC',
      fontSize: 20.sp,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    subtitle1: TextStyle(
      fontFamily: 'GOTHIC',
      fontSize: 18.sp,
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: lightBackground),
);
