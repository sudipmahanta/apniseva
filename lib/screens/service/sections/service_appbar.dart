import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../../utils/color.dart';

class ServiceAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const ServiceAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          titleSpacing: 0,
          elevation: 0,
          automaticallyImplyLeading: true,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Remix.arrow_left_s_line)),
          title: Text(title,
            style: const TextStyle(
              fontSize: 16
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(Remix.shopping_cart_2_fill),
            )
          ],
          backgroundColor: primaryColor,
        )
    );
  }


}
