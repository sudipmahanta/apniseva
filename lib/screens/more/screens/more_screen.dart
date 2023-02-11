
import 'package:apniseva/controller/auth_controller/auth_controller.dart';
import 'package:apniseva/screens/orders/screens/order_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/color.dart';
import '../../address/screen/address_screen.dart';
import '../../auth/screens/registration_screen.dart';
import '../../cart/screen/cart_screen.dart';
import '../../dashboard/widget/dash_strings.dart';
import '../../profile/profile_screen/profile_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {

  final profileController = Get.put(AuthController());

  List screens = const [
    CartScreen(),
    ProfileScreen(),
    AddressScreen(),
    BookingScreen(),
    CartScreen(),
    CartScreen(),
    CartScreen(),
    CartScreen(),
    CartScreen(),
  ];

  List<String> items = [
    'Notifications',
    'Profile',
    'Address',
    'Orders',
    'Terms & Conditions',
    'Privacy Policy',
    'FAQ',
    'Career',
    'Blog',
    'Contact Us',
    'Support & Help'
  ];


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.22,
                width: width,
                color: primaryColor,
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User Profile Image
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Stack(
                        children: [
                          InkWell(
                            // onTap: () {
                            //   Get.to(() => const EditProfile());
                            // },
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(DashStrings.bannerImg),
                            ),
                          ),
                          const Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.indigo,
                              radius: 10,
                              child: Icon(
                                Icons.verified_user,
                                size: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // User Profile Name
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        profileController.userModel.value.messages!.status!.fullname ??
                            'Adam West',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "User ID: ${profileController.userModel.value.messages!.status!.userId}",
                        style: Theme.of(context).textTheme.bodySmall
                      )
                    ),
                  ],
                ),
              ),

              InkWell(
                onTap: () {

                },
                child: Container(
                  width: width,
                  height: height * 0.083,
                  decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide.none,
                        top: BorderSide.none,
                        right: BorderSide.none,
                        bottom:
                        BorderSide(color: Colors.grey),
                      )),
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 8, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          ' Notifications',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )),
                ),
              ),

              InkWell(
                onTap: () {

                },
                child: Container(
                  width: width,
                  height: height * 0.083,
                  decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide.none,
                        top: BorderSide.none,
                        right: BorderSide.none,
                        bottom:
                        BorderSide(color: Colors.grey),
                      )),
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 8, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          ' Profile',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )),
                ),
              ),

              InkWell(
                onTap: () {

                },
                child: Container(
                  width: width,
                  height: height * 0.083,
                  decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide.none,
                        top: BorderSide.none,
                        right: BorderSide.none,
                        bottom:
                        BorderSide(color: Colors.grey),
                      )),
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 8, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          ' Address',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )),
                ),
              ),

              InkWell(
                onTap: () {

                },
                child: Container(
                  width: width,
                  height: height * 0.083,
                  decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide.none,
                        top: BorderSide.none,
                        right: BorderSide.none,
                        bottom:
                        BorderSide(color: Colors.grey),
                      )),
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 8, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          ' Orders',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )),
                ),
              ),

              InkWell(
                onTap: () {

                },
                child: Container(
                  width: width,
                  height: height * 0.083,
                  decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide.none,
                        top: BorderSide.none,
                        right: BorderSide.none,
                        bottom:
                        BorderSide(color: Colors.grey),
                      )),
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 8, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          ' Terms & Conditions',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )),
                ),
              ),

              InkWell(
                onTap: () {

                },
                child: Container(
                  width: width,
                  height: height * 0.083,
                  decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide.none,
                        top: BorderSide.none,
                        right: BorderSide.none,
                        bottom:
                        BorderSide(color: Colors.grey),
                      )),
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 8, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          ' Privacy Policy',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )),
                ),
              ),

              InkWell(
                onTap: () {

                },
                child: Container(
                  width: width,
                  height: height * 0.083,
                  decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide.none,
                        top: BorderSide.none,
                        right: BorderSide.none,
                        bottom:
                        BorderSide(color: Colors.grey),
                      )),
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 8, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          ' FAQ',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )),
                ),
              ),

              InkWell(
                onTap: () {

                },
                child: Container(
                  width: width,
                  height: height * 0.083,
                  decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide.none,
                        top: BorderSide.none,
                        right: BorderSide.none,
                        bottom:
                        BorderSide(color: Colors.grey),
                      )),
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 8, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          ' Career',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )),
                ),
              ),

              InkWell(
                onTap: () {

                },
                child: Container(
                  width: width,
                  height: height * 0.083,
                  decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide.none,
                        top: BorderSide.none,
                        right: BorderSide.none,
                        bottom:
                        BorderSide(color: Colors.grey),
                      )),
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 8, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          ' Blog',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )),
                ),
              ),

              InkWell(
                onTap: () {

                },
                child: Container(
                  width: width,
                  height: height * 0.083,
                  decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide.none,
                        top: BorderSide.none,
                        right: BorderSide.none,
                        bottom:
                        BorderSide(color: Colors.grey),
                      )),
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 8, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          ' Contact Us',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )),
                ),
              ),

              InkWell(
                onTap: () {

                },
                child: Container(
                  width: width,
                  height: height * 0.083,
                  decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide.none,
                        top: BorderSide.none,
                        right: BorderSide.none,
                        bottom:
                        BorderSide(color: Colors.grey),
                      )),
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 8, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          ' Support & Help',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )),
                ),
              ),

              InkWell(
                onTap: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  pref.clear();
                  Get.deleteAll();
                  Get.offAll(() => const RegistrationScreen());
                },
                child: Container(
                  width: width,
                  height: height * 0.083,
                  decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide.none,
                        top: BorderSide.none,
                        right: BorderSide.none,
                        bottom:
                        BorderSide(color: Colors.grey),
                      )),
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 8, bottom: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          ' Log Out',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
