import 'package:apniseva/controller/auth_controller/auth_controller.dart';
import 'package:apniseva/screens/dashboard/sections/dash_carousel.dart';
import 'package:apniseva/screens/dashboard/sections/dash_mostBookServices.dart';
import 'package:apniseva/screens/dashboard/sections/dash_reviews.dart';
import 'package:apniseva/screens/dashboard/sections/dash_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/input_field.dart';
import '../sections/dash_appbar.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key,
  }) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {

  final authController = Get.put(AuthController());

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      authController.getUserData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);

    return Scaffold(
      appBar: const DashAppBar(),
      body: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchField(),
              SizedBox(height: height * 0.04),

              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Our Services',
                    style: Theme.of(context).textTheme.headlineLarge,
                  )
              ),
              const DashServices(),
              SizedBox(height: height * 0.02),

              const DashCarousel(),
              SizedBox(height: height * 0.02),

              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Most Booked Services',
                    style: Theme.of(context).textTheme.headlineLarge,
                  )
              ),
              const DashBookedServices(),
              SizedBox(height: height * 0.03),

              Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Your Reviews',
                    style: Theme.of(context).textTheme.headlineLarge,
                  )
              ),
              const DashReviews()
            ],
          ),
        )
      ),
    );
  }
}