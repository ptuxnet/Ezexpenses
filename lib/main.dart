import 'package:ezexpense/widget/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF201F1F),
        primarySwatch: Colors.grey,
        hintColor: const Color(0xFFACB6B2), // Spun Pearl
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          color: Color(0xFF201F1F), // Dark Black
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF201F1F), // Dark Black
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF201F1F), // Dark Black
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF201F1F), // Dark Black
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Color(0xFF201F1F), // Dark Black
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white, // White color for button text
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF201F1F)), // Dark Black
          ),
          labelStyle: TextStyle(color: Color(0xFF201F1F)), // Dark Black
        ),
      ),
      home: const Expenses(),
      debugShowCheckedModeBanner: false,
    );
  }
}
