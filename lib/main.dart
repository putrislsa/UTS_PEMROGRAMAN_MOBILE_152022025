import 'package:flutter/material.dart';
import 'config/app_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const UtsApp());
}

class UtsApp extends StatelessWidget {
  const UtsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTS Mobile',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
