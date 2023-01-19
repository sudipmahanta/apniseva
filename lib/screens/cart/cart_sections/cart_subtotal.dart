import 'package:apniseva/utils/buttons.dart';
import 'package:flutter/material.dart';

class CartSubTotal extends StatefulWidget {
  const CartSubTotal({Key? key}) : super(key: key);

  @override
  State<CartSubTotal> createState() => _CartSubTotalState();
}

class _CartSubTotalState extends State<CartSubTotal> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);

    return Card(
      elevation: 1.5,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sub-Total',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text('Rs 1750.0 /-',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              ),
            ),

            Text('Date',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextFormField(
              onTap: () {},
              readOnly: true,
            ),
            SizedBox(height: height * 0.01),

            Text('Time',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextFormField(
              onTap: () {},
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}
