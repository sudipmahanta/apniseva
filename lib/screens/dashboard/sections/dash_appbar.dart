import 'package:apniseva/controller/cart_controller/cart_controller.dart';
import 'package:apniseva/screens/cart/screen/cart_screen.dart';
import 'package:apniseva/screens/splash_screen/widgets/spalsh_string.dart';
import 'package:apniseva/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';

import '../../../controller/location_controller/location_controller.dart';
import '../../location/screen/location.dart';

class DashAppBar extends StatefulWidget implements PreferredSizeWidget{
  const DashAppBar({Key? key}) : super(key: key);

  @override
  State<DashAppBar> createState() => _DashAppBarState();
  @override
  Size get preferredSize => const Size.fromHeight(55);
}

class _DashAppBarState extends State<DashAppBar> {

  final locController = Get.put(LocationController());
  String? cityName = 'Location';

  @override
  void initState() {
    Future.delayed(Duration.zero, (){
      locController.getLoc();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return PreferredSize(
        preferredSize: widget.preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Image.asset(SplashStrings.apniSevaLogo,
            height: 55,
            width: 90,
            color: Colors.white,
          ),
          actions: [
            InkWell(
              onTap: () {
                showDialog(context: context, builder: (context) {
                  return const GetLocation();
                });
              },
              child: Container(
                  height: 55,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Text(cityName!),
                      const Icon(Icons.location_on_rounded,
                        size: 20,
                      ),
                     const SizedBox(width: 5,)
                    ],
                  )
              ),
            ),

            InkWell(
              onTap: () {
                Get.to(()=> const CartScreen());
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(Remix.shopping_cart_2_fill),
              ),
            )
          ],
        )
    );
  }
}
