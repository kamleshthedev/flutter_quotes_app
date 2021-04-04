import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData themeData() {
  return ThemeData(
    fontFamily: 'Nunito',
    scaffoldBackgroundColor: kDarkColor,
    appBarTheme: appBarTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    brightness: Brightness.dark,
    centerTitle: true,
    elevation: 0,
    color: kDarkColor,
  );
}
