import 'package:flutter/material.dart';

import '../cart_strings/cart_strings.dart';

class CartOrderScheduleTotal extends StatefulWidget {
  const CartOrderScheduleTotal({Key? key,}) : super(key: key);

  @override
  State<CartOrderScheduleTotal> createState() => _CartOrderScheduleTotalState();
}

class _CartOrderScheduleTotalState extends State<CartOrderScheduleTotal> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);

    return Card(
      elevation: 1.5,
      color: Colors.grey.shade100,

      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(CartStrings.schedule,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            Text(CartStrings.date,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextFormField(
              onTap: () {},
              // readOnly: true,
            ),
            SizedBox(height: height * 0.01),

            Text(CartStrings.time,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextFormField(
              onTap: () {},
              // readOnly: true,
            ),
            SizedBox(height: height * 0.01),
          ],
        ),
      ),
    );
  }
}
