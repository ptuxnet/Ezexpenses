import 'package:ezexpense/screens/onboarding.dart';
import 'package:ezexpense/themes/color_theme.dart';
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
      home: const TodoistLoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
