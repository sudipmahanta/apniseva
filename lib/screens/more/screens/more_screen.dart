
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/color.dart';
import '../../address/screen/address_screen.dart';
import '../../auth/screens/registration_screen.dart';
import '../../cart/screen/cart_screen.dart';
import '../../dashboard/widget/dash_strings.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {

  List screens = [
    CartScreen(),
    CartScreen(),
    AddressScreen(),
    CartScreen(),
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
  ];


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: height * 0.20,
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
                        const CircleAvatar(
                          backgroundColor: Colors.indigo,
                          radius: 10,
                          child: Icon(
                            Icons.edit,
                            size: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // User Profile Name
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      // authController.usermodel.value.data!.fullName ??
                          'Adam West',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      "User ID",
                      // 'User ID #2512467',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          letterSpacing: 0.3),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => screens[index]));
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
                              ' ${items[index]}',
                            ),
                          )),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //         const SupportScreen()));
                    },
                    child: const Text(
                      'Support & Help',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.0,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      pref.clear();
                      Get.deleteAll();
                      Get.offAll(() => const RegistrationScreen());
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Remix.logout_box_line,
                          size: 15,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Log out',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.0,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    /*Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.clear();
              Get.deleteAll();
              Get.offAll(() => const RegistrationScreen());
            },
            child: Text('More')),
      )
    );*/
  }
}
