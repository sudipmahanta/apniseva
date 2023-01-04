import 'package:apniseva/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class DashAppBar extends StatelessWidget implements PreferredSizeWidget{
  const DashAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          
          actions: [

            Container(
                height: 55,
                alignment: Alignment.center,
                child: const Text('Bhubaneswar')
            ),
            IconButton(
                onPressed: (){

                  },
                icon: const Icon(Remix.map_pin_2_fill)
            )
          ],
        )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
