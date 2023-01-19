import 'package:flutter/material.dart';

import '../../../utils/color.dart';
import '../booking_widget/booking_strings.dart';
import '../sections/booking_appbar.dart';
import 'booking_details.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);

    return Scaffold(
      appBar: BookingAppBar(
        title: BookingStrings.title,
      ),
      body: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Card(
                  elevation: 1.5,
                  color: Colors.grey.shade200,
                  child: Container(
                    height: 120,
                    width: width,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // OrderID
                        RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${BookingStrings.orderID}:  ",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                TextSpan(
                                  text: "#AC-97202301181123",
                                  style: Theme.of(context).textTheme.labelSmall,
                                )
                              ]
                            )
                        ),
                        const Spacer(),

                        // Service Date & Time
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${BookingStrings.serviceDateTime}:  ",
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  TextSpan(
                                    text: "2023-01-19 10:53",
                                    style: Theme.of(context).textTheme.labelSmall,
                                  )
                                ]
                            )
                        ),
                        SizedBox(height: height * 0.005),

                        // Order Date
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${BookingStrings.orderDate}:  ",
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  TextSpan(
                                    text: "2023-01-19 05:23:55",
                                    style: Theme.of(context).textTheme.labelSmall,
                                  )
                                ]
                            )
                        ),
                        SizedBox(height: height * 0.005),

                        // Amount
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "${BookingStrings.amount}:  ",
                                        style: Theme.of(context).textTheme.titleLarge,
                                      ),
                                      TextSpan(
                                        text: "Rs 1200.00",
                                        style: Theme.of(context).textTheme.labelSmall,
                                      )
                                    ]
                                )
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingDetails()));
                              },
                              child: Text('View Details',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: primaryColor,
                                  decoration: TextDecoration.underline
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                ),
              );
        }),
      )
    );
  }
}
