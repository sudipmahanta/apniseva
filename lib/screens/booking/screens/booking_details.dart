import 'package:apniseva/screens/booking/sections/booking_appbar.dart';
import 'package:flutter/material.dart';

import '../booking_widget/booking_strings.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);

    return Scaffold(
      appBar: BookingAppBar(
        title: BookingDetailStrings.title,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            // OrderID
            Align(
              alignment: Alignment.centerRight,
              child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${BookingDetailStrings.orderID}:  ",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextSpan(
                          text: "#AC-97202301181123",
                          style: Theme.of(context).textTheme.labelSmall,
                        )
                      ]
                  )
              ),
            ),
            SizedBox(height: height * 0.005,),

            // Service Date & Time
            Align(
              alignment: Alignment.centerRight,
              child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${BookingDetailStrings.serviceDateTime}:  ",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextSpan(
                          text: "2023-01-19 10:53",
                          style: Theme.of(context).textTheme.labelSmall,
                        )
                      ]
                  )
              ),
            ),
            SizedBox(height: height * 0.015,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Service
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(BookingDetailStrings.service,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text('Ac Repair (Split Ac)',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelMedium,
                        )
                      ],
                    ),
                ),

                //Quantity
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(BookingDetailStrings.quantity,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text('1',
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  ),
                ),

                // Price
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(BookingDetailStrings.price,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text('1200',
                          style: Theme.of(context).textTheme.labelMedium,
                        )
                      ],
                    ),
                ),

                //Total
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(BookingDetailStrings.total,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text('1200',
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.1),
            const Divider(),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(BookingDetailStrings.total,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    )
                ),

                const Expanded(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text('1')
                    )
                ),

                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(BookingDetailStrings.totalPrice,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        SizedBox(height: height * 0.01),

                        Text(BookingDetailStrings.discount,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        SizedBox(height: height * 0.01),

                        Text(BookingDetailStrings.gst,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        SizedBox(height: height * 0.01),

                        FittedBox(
                          child: Text(BookingDetailStrings.grandTotal,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        SizedBox(height: height * 0.01),

                        FittedBox(
                          child: Text(BookingDetailStrings.dueAmount,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        )
                      ],
                    )
                ),

                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Rs 1200.00',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: height * 0.01),

                        Text('Rs 1200.00',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: height * 0.01),

                        Text('Rs 1200.00',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: height * 0.01),

                        Text('Rs 1200.00',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(height: height * 0.01),

                        Text('Rs 1200.00',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    )
                ),
              ],
            ),
            SizedBox(height: height * 0.02,),

            // Address and Service
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Delivery Address'),
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

                    ],
                  ),
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Service Date'),
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
                      ],
                    )
                )
              ],
            )
          ],
        ),
      ),

    );
  }
}
