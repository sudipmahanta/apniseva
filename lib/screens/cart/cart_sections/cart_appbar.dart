import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../address/screen/address_screen.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const CartAppBar({Key? key,
    this.title = 'Title',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text(title),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddressScreen()));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(Remix.add_circle_line),
              ),
            )
          ],
        )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
