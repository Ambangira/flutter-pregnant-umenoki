///
/// Project name : Umenoki
/// Description : It's defined the colors, fonts, and font styles used by default in the app.
/// Author : Xiao
/// Date : 2020-04-26
///

import 'package:flutter/material.dart';

class AppTheme {
  static const Color nearlyPink = Color(0xFFF37D86);                  // bottom nav bar background color
  static const Color nearlyDarkRed = Color(0xFF9F2F3A);               // bottom nav bar text color
  static const Color nearlyRed = Color(0xFFF37D86);
  static const Color nearlyDark = Color(0xFF707070);
  static const Color nearlyGray = Color(0xFFFFE3EA);
  static const Color nearlyBrown = Color(0xFFEABC9E);
  static const Color nearlyBlack = Color(0xFF623F06);
  static const Color nearlyWhite = Color(0xFFFFEAEA);

  static const String fontName = "Avenir";

  static const TextTheme textTheme = TextTheme(
    body2: body2,
    body1: body1,
    title: title,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontSize: 22,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subTitle = TextStyle(
    fontFamily: fontName,
    fontSize: 17,
    color: nearlyDark,
    fontWeight: FontWeight.bold,
  );

  // body2 -> body1
  static const TextStyle body1 = TextStyle( 
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 17,
    letterSpacing: -0.05,
  );

  // body1 -> body2
  static const TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
  );
}