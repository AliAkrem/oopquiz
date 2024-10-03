import 'package:flutter/material.dart';
import 'package:oopquiz/utils/constants.dart';

var appTheme = ThemeData(
    fontFamily: 'Nunito',
    brightness: Brightness.dark,
    primaryColor: charcoalColor,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      color: charcoalColor,
        elevation: 1, titleTextStyle: TextStyle(fontSize: 20)),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
    )));
 