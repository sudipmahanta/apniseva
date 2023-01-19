import 'package:apniseva/screens/cart/cart_sections/cart_subtotal.dart';
import 'package:apniseva/screens/cart/cart_strings/cart_strings.dart';
import 'package:apniseva/screens/dashboard/widget/dash_strings.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../../utils/buttons.dart';
import '../cart_sections/apply_coupon.dart';
import '../cart_sections/cart_appbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);

    return Scaffold(
      appBar: CartAppBar(
        title: CartStrings.title,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: List.generate(
                    2, (index) =>
                      Card(
                          color: Colors.grey.shade100,
                          child: Container(
                            height: 75,
                            alignment: Alignment.center,
                            child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(DashStrings.bannerImg,
                                width: 60,
                                height: 75,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: const Text('Anti Rust Deep Clean AC Services '),
                            subtitle: const Text('Total: Rs 1200. 00'),
                            trailing: const Icon(Remix.delete_bin_6_fill),
                          ),
                          )
                      ),
                  ),
                ),
                SizedBox(height: height * 0.02),

                const CartApplyCoupon(),

                const CartSubTotal(),

                RadioListTile(
                    title: Text(CartStrings.pod,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    toggleable: true,
                    value: 0,
                    groupValue: 1,
                    onChanged: (value){}
                ),

                RadioListTile(
                    title: Text(CartStrings.payOnline,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    toggleable: true,
                    value: 0,
                    groupValue: 1,
                    onChanged: (value){}
                ),

                RadioListTile(
                    title: Text(CartStrings.accept,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    toggleable: true,
                    value: 1,
                    groupValue: 1,
                    onChanged: (value){}
                ),

                PrimaryButton(
                    width: width,
                    height: 47,
                    onPressed: (){},
                    label: CartStrings.book
                )
            ]
          ),
        ),
      ),
    );
  }
}

