import 'package:apniseva/screens/cart/cart_strings/cart_strings.dart';
import 'package:flutter/material.dart';

class CartApplyCoupon extends StatefulWidget {
  const CartApplyCoupon({Key? key}) : super(key: key);

  @override
  State<CartApplyCoupon> createState() => _CartApplyCouponState();
}

class _CartApplyCouponState extends State<CartApplyCoupon> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);

    return Card(
      elevation: 1.5,
      color: Colors.grey.shade100,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(CartStrings.coupons,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),

            TextFormField(
              // controller: ,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextButton(
                onPressed: (){},
                child: Text(CartStrings.applyCoupon),
            ),
            SizedBox(
              height: height * 0.03,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(CartStrings.subtotal,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text('Rs 1200.00',
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
            const Divider(
              thickness: 1.0,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(CartStrings.couponApplied,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text('Rs 1200.00',
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
            const Divider(
              thickness: 1.0,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(CartStrings.gst,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text('Rs 1200.00',
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
