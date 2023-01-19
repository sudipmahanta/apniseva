import 'package:apniseva/screens/dashboard/screens/dashboard_screen.dart';
import 'package:apniseva/screens/more/screens/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:remixicon/remixicon.dart';

import '../screens/booking/screens/booking_screen.dart';
import 'color.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {

    List<PersistentBottomNavBarItem> item = [
      PersistentBottomNavBarItem(
        icon: const Icon(Remix.home_fill),
        title: ("Home"),
        iconSize: 22,
        textStyle: Theme.of(context).textTheme.titleMedium,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.grey.shade400,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Remix.clipboard_fill),
        iconSize: 22,
        title: ('Bookings'),
        textStyle: Theme.of(context).textTheme.titleMedium,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.grey.shade400,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Remix.more_2_line),
        iconSize: 22,
        title: ('More'),
        textStyle: Theme.of(context).textTheme.titleMedium,
        activeColorPrimary: primaryColor,
        inactiveColorPrimary: Colors.grey.shade400,
      ),
    ];

    List<Widget> screens =  const [
      DashScreen(),
      BookingScreen(),
      MoreScreen()
    ];

    return PersistentTabView(
      context,
      controller: _controller,
      screens: screens,
      items: item,
      confineInSafeArea: true,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style8,
    );
  }
}
