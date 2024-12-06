import 'package:flutter/material.dart';

class AppTheme {
  static const Color appBarColor = Color(0xff1e1e1e);
  static const Color titleColor = Color(0xffeacc55);
  static const Color containerColor = Color.fromARGB(255, 250, 225, 225);
  static const Color textFieldColor = Color(0xffffffff);

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    cardColor: containerColor,
    brightness: Brightness.light,
    primaryColor: appBarColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      titleTextStyle: TextStyle(
        color: titleColor,
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 22.0, 
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0, 
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0, 
        color: Colors.black,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      hintStyle: TextStyle(
        fontSize: 14.0,
        color: Colors.grey,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: titleColor,
        textStyle: const TextStyle(
          fontSize: 16.0, 
          fontWeight: FontWeight.bold,
        ),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
      ),
    ),
  );
}