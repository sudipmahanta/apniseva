import 'dart:async';
import 'package:apniseva/screens/dashboard/screens/dashboard_screen.dart';
import 'package:apniseva/utils/api_strings/api_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/bottom_nav_bar.dart';
import '../../auth/screens/registration_screen.dart';
import '../widgets/spalsh_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen()));
    // });
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? mobile = pref.getString(ApiStrings.mobile);
    if(mobile == null) {
      Get.offAll(() => const RegistrationScreen());
    } else {
      Get.offAll(() => const BottomNavBar());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(SplashStrings.apniSevaLogo),
      ),
    );
  }
}