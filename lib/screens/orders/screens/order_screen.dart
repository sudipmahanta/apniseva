import 'package:apniseva/controller/order_controller/order_controller.dart';
import 'package:apniseva/utils/api_strings/api_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/color.dart';
import '../order_model/order_model.dart';
import '../order_widget/order_strings.dart';
import '../sections/booking_appbar.dart';
import 'order_details_screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  final orderController = Get.put(OrderController());

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      orderController.getOrders();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);

    return Obx(() {
        return Scaffold(
          appBar: OrdersAppBar(title: OrderStrings.title),
          body: Container(
            width: width,
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: orderController.isLoading.value == true ? Center(
              child: CircularProgressIndicator(
                color: primaryColor,
                strokeWidth: 2.5,
              ),
            ) :
            ListView.builder(
                itemCount:  orderController.orderDataModel.value.messages!.status!.orderdtls!.length,
                itemBuilder: (context, index) {
                  List<Orderdtl>? orderData = orderController.orderDataModel.value.messages!.status!.orderdtls;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Card(
                      elevation: 1.5,
                      color: Colors.grey.shade200,
                      child: Container(
                        height: height * 0.21,
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
                                      text: OrderStrings.orderID,
                                      style: Theme.of(context).textTheme.titleLarge,
                                    ),
                                    TextSpan(
                                      text: orderData![index].orderId!,
                                      style: Theme.of(context).textTheme.labelSmall,
                                    ),
                                  ]
                                )
                            ),
                            const Spacer(),

                            // Service Date & Time
                            RichText(
                                text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: OrderStrings.serviceDate,
                                        style: Theme.of(context).textTheme.titleLarge,
                                      ),
                                      TextSpan(
                                        text: orderData[index].bookingDate!.toString(),
                                        style: Theme.of(context).textTheme.labelSmall,
                                      )
                                    ]
                                )
                            ),
                            SizedBox(height: height * 0.005),

                            RichText(
                                text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: OrderStrings.serviceTime,
                                        style: Theme.of(context).textTheme.titleLarge,
                                      ),
                                      TextSpan(
                                        text: orderData[index].bookingTime!,
                                        style: Theme.of(context).textTheme.labelSmall,
                                      )
                                    ]
                                )
                            ),
                            SizedBox(height: height * 0.005),

                            // Order Date
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "${OrderStrings.orderDate}:  ",
                                            style: Theme.of(context).textTheme.titleLarge,
                                          ),
                                          TextSpan(
                                            text: orderData[index].bookingDate!.toString(),
                                            style: Theme.of(context).textTheme.labelSmall,
                                          )
                                        ]
                                    )
                                ),

                                InkWell(
                                  onTap: () async{
                                    SharedPreferences pref = await SharedPreferences.getInstance();
                                    pref.setString(ApiStrings.orderID, orderData[index].orderId.toString());
                                    debugPrint(orderData[index].orderId.toString());
                                    Get.to(()=> const OrderBookingDetails());
                                  },
                                  child: Row(
                                    children: [
                                      Text(OrderStrings.viewDetails,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: primaryColor,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      const Icon(Icons.double_arrow_rounded,
                                        size: 14,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: height * 0.005),
                          ],
                        ),
                      ),
                    ),
                  );
            }),
          )
        );
      }
    );
  }
}
