import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/bottom_nav_bar.dart';

class SuccessfulScreen extends StatefulWidget {
  const SuccessfulScreen({Key? key}) : super(key: key);

  @override
  State<SuccessfulScreen> createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), (){
      Get.to(()=> const BottomNavBar());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: const Text('Request sent successfully'),
      ),
    );
  }
}
