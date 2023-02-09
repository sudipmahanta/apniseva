import 'package:apniseva/controller/dashboard_controller/dash_controller.dart';
import 'package:apniseva/controller/order_details_controller/order_details_controller.dart';
import 'package:apniseva/screens/dashboard/sections/dash_carousel.dart';
import 'package:apniseva/screens/dashboard/sections/dash_reviews.dart';
import 'package:apniseva/screens/dashboard/sections/dash_services.dart';
import 'package:apniseva/screens/dashboard/widget/dash_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';
import '../../../utils/input_field.dart';
import '../sections/dash_appbar.dart';
import 'all_service_screen.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key,
  }) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {

  final DashController dashController = Get.put(DashController());
  // final OrderDetailsController orderDetailsController = Get.put(OrderDetailsController());

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      dashController.getDashboard();
      // orderDetailsController.getOrderDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (
        MediaQuery.of(context).padding.bottom +
            MediaQuery.of(context).padding.top
    );

    return Obx(() {
        return Scaffold(
          appBar: const DashAppBar(),
          body:
          dashController.isLoading.value == true ? Center(
            child: CircularProgressIndicator(
              color: primaryColor,
              strokeWidth: 2.5,
            ),
          ) :
          Container(
              width: width,
              height: height,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SearchField(),
                    SizedBox(height: height * 0.04),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(DashStrings.ourServices,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Visibility(
                          visible: dashController.dashDataModel.value.messages!.status!.categoryDtl!.length > 6 ? true : false,
                          child: InkWell(
                            onTap: () {
                              Get.to(()=> AllServiceScreen(getData: dashController.dashDataModel.value.messages!.status!.categoryDtl!));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                              child: Text(DashStrings.viewAll,
                                style: TextStyle(
                                  letterSpacing: 1.3,
                                  fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                                  color: Theme.of(context).textTheme.titleMedium!.color
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    DashCategory(
                      getData: dashController.dashDataModel.value.messages!.status!.categoryDtl!,
                    ),
                    SizedBox(height: height * 0.02),

                    DashCarousel(
                      getData: dashController.dashDataModel.value.messages!.status!.offerDtl!,
                    ),
                    SizedBox(height: height * 0.02),

                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Your Reviews',
                          style: Theme.of(context).textTheme.headlineLarge,
                        )
                    ),
                    DashReviews(
                      getTestimonialDetail: dashController.dashDataModel.value.messages!.status!.testimonialDtl!,
                    )
                  ],
                ),
              )
          ),
        );
      }
    );
  }
}