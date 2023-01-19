import 'package:apniseva/utils/buttons.dart';
import 'package:flutter/material.dart';

import '../../../utils/color.dart';

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
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('Coupons',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),

            TextFormField(
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextButton(
                onPressed: (){},
                child: Text('Apply Coupon')
            ),

            SizedBox(
              height: height * 0.03,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal',
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
                Text('Coupon Applied',
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
                Text('GST',
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
