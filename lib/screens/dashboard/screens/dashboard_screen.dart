import 'package:apniseva/screens/dashboard/sections/dash_carousel.dart';
import 'package:apniseva/screens/dashboard/sections/dash_mostBookServices.dart';
import 'package:apniseva/screens/dashboard/sections/dash_reviews.dart';
import 'package:apniseva/screens/dashboard/sections/dash_services.dart';
import 'package:flutter/material.dart';

import '../../../utils/bottom_nav_bar.dart';
import '../../../utils/input_field.dart';
import '../widget/dash_appbar.dart';

class DashScreen extends StatelessWidget {
  const DashScreen({Key? key}) : super(key: key);

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