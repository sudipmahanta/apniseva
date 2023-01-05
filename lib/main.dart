import 'package:apniseva/screens/auth/screens/registration_screen.dart';
import 'package:apniseva/screens/dashboard/screens/dashboard_screen.dart';
import 'package:apniseva/screens/splashScreen/screens/splash_screen.dart';
import 'package:apniseva/utils/bottom_nav_bar.dart';
import 'package:apniseva/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const RegistrationScreen(),
      // home: const BottomNavBar(),
    );
  }
}



