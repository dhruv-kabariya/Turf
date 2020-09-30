import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: Colors.black,
    primaryColor: Color(0xFFDC2E27),
    cardColor: Color(0xcc353535),
    iconTheme: IconThemeData(color: Colors.white70),
    colorScheme: ColorScheme(
        primary: Color(0xff353535),
        primaryVariant: Color(0xff353535),
        secondary: Color(0xfffc3157),
        secondaryVariant: Color(0xfffc3157),
        surface: Colors.black,
        background: Colors.black,
        error: Colors.red,
        onPrimary: Colors.transparent,
        onSecondary: Colors.redAccent,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.red,
        brightness: Brightness.dark),
    buttonTheme: ButtonThemeData(buttonColor: Color(0xfffc3147)),
    textTheme: TextTheme(

        // main heading for detail page heading,
        headline1: TextStyle(
            fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),

        // for heading part 2,like card heading
        headline2: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),

        //
        headline3: TextStyle(color: Colors.white, fontSize: 16),

        // for details heading like detail,owner's detail,
        headline4: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
// for textediting box
        headline5: TextStyle(color: Colors.white70, fontSize: 16),

        // main text like detail page detail,address,location
        bodyText1: TextStyle(
          color: Colors.white70,
          fontSize: 14,
        ),
        bodyText2: TextStyle(),

        // for small text with contrast like tag text,
        caption: TextStyle(
          color: Colors.black87,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),

        // for text beside icon,
        subtitle1: TextStyle(
          color: Colors.white70,
          fontSize: 14,
        ),

        // for extra small text like updat time,registed uder
        subtitle2: TextStyle(color: Colors.white54, fontSize: 10)),

    // accentColor: Color
  );
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    primaryColor: Color(0xFFDC2E27),
    cardColor: Color(0xcc353535),
    iconTheme: IconThemeData(color: Colors.black87),
    colorScheme: ColorScheme(
        primary: Color(0xff353535),
        primaryVariant: Color(0xff353535),
        secondary: Color(0xfffc3157),
        secondaryVariant: Color(0xfffc3157),
        surface: Colors.white,
        background: Colors.white,
        error: Colors.red,
        onPrimary: Colors.transparent,
        onSecondary: Colors.redAccent,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.red,
        brightness: Brightness.light),
    buttonTheme: ButtonThemeData(buttonColor: Color(0xfffc3147)),
    textTheme: TextTheme(
      // main heading for detail page heading,
      headline1: TextStyle(
          fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),

      // for heading part 2,like card heading
      headline2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),

      //
      headline3: TextStyle(color: Colors.black, fontSize: 16),

      // for details heading like detail,owner's detail,
      headline4: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
// for textediting box
      headline5: TextStyle(color: Colors.white70, fontSize: 16),

      // main text like detail page detail,address,location
      bodyText1: TextStyle(
        color: Colors.black87,
        fontSize: 14,
      ),
      bodyText2: TextStyle(),

      // for small text with contrast like tag text,
      caption: TextStyle(
        color: Colors.white70,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),

      // for text beside icon,
      subtitle1: TextStyle(
        color: Colors.black87,
        fontSize: 14,
      ),

      // for extra small text like updat time,registed uder
      subtitle2: TextStyle(color: Colors.black54, fontSize: 10),
    ),
  );
}
