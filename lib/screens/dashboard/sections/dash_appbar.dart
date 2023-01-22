import 'package:apniseva/screens/cart/screen/cart_screen.dart';
import 'package:apniseva/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/location_controller/location_controller.dart';
import '../../../utils/api_strings/api_strings.dart';
import '../../location/screen/location.dart';

class DashAppBar extends StatefulWidget implements PreferredSizeWidget{
  const DashAppBar({Key? key}) : super(key: key);

  @override
  State<DashAppBar> createState() => _DashAppBarState();
  @override
  Size get preferredSize => const Size.fromHeight(55);
}

class _DashAppBarState extends State<DashAppBar> {
  String? cityName = 'Bhubaneswar';

  getLocString() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    cityName = pref.getString(ApiStrings.cityName);
    debugPrint('AppBar: $cityName');
    return cityName;
  }

  @override
  void initState() {
    getLocString();
    cityName;
    super.initState();
  }

  final locController = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {

    return PreferredSize(
        preferredSize: widget.preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          // backgroundColor: primaryColor,
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
                          // locController.locationModel.value.messages!.status!.city!.map((e) => e.cityName).toString()),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
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
