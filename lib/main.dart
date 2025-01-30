import 'package:ezexpense/themes/color_theme.dart';
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
      theme: appTheme,
      home: const Expenses(),
      debugShowCheckedModeBanner: false,
    );
  }
}
