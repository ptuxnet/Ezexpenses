import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFF0052CC), // Brand Primary Default 600
  colorScheme: const ColorScheme(
    primary: Color(0xFF0052CC), // Brand Primary Default 600
    secondary: Color(0xFF253858), // Secondary Default 600
    surface: Color(0xFFFFFFFF),
    error: Color(0xFFDE350B), // Error Default 600
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: const Color(0xFFF4F5F7),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF0052CC),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF0052CC),
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF172B4D)),
    displayMedium: TextStyle(
        fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF172B4D)),
    bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF42526E)),
    bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF42526E)),
    bodySmall: TextStyle(fontSize: 12, color: Color(0xFF6B778C)),
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    shadowColor: Colors.black12,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
  iconTheme: const IconThemeData(color: Color(0xFF42526E)),
);
