import 'package:flutter/material.dart';
import 'constant.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: kPrimaryColor,
    accentColor: Colors.grey,
    appBarTheme: AppBarTheme(
      color: kPrimaryColor,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(kPrimaryColor),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(kPrimaryColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: kTextLabelColor),
    ),
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor),
    ),
  );
}
