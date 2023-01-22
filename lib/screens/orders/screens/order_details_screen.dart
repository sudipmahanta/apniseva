import 'package:apniseva/controller/order_details_controller/order_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../profile/profile_sections/profile_app_bar.dart';
import '../order_details_model/order_details_model.dart';
import '../order_widget/order_strings.dart';

class OrderBookingDetails extends StatefulWidget {
  const OrderBookingDetails({Key? key}) : super(key: key);

  @override
  State<OrderBookingDetails> createState() => _OrderBookingDetailsState();
}

class _OrderBookingDetailsState extends State<OrderBookingDetails> {

  final orderDetailsController = Get.put(OrderDetailsController());
  double discounted = 0.0;
  var gst = 0.0;
  var gstPrice = 0.0;
  var totalPrice = 0.0;

  @override
  void initState() {
    Future.delayed(Duration.zero,() {
      orderDetailsController.getOrderDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);

    return Obx(() {
      List<Orderdtl> orderDetails = orderDetailsController.orderDetailsModel.value.messages!.status!.orderdtls!;
      List<Address> orderAddress = orderDetailsController.orderDetailsModel.value.messages!.status!.address!;
      // List<> addOrder = orderDetailsController.orderDetailsModel.value.messages!.status!.addOrderdtls!;

      return Scaffold(
        appBar: PrimaryAppBar(
          title: OrdersDetailStrings.title,
        ),
        body: orderDetailsController.isLoading.value == true ?
        Center(
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: Theme.of(context).primaryColor,
            )
        ) :
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              // OrderID
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: OrdersDetailStrings.orderID,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextSpan(
                          text: orderDetails[0].orderId,
                          style: Theme.of(context).textTheme.labelSmall,
                        )
                      ]
                  )
              ),
              SizedBox(height: height * 0.005),

              // Service Date & Time
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: OrdersDetailStrings.scheduleDate,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextSpan(
                          text: orderDetails[0].createdDate,
                          style: Theme.of(context).textTheme.labelSmall,
                        )
                      ]
                  )
              ),
              SizedBox(height: height * 0.015,),

              //Time
              RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: OrdersDetailStrings.scheduleTime,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        TextSpan(
                          text: orderDetails[0].bookingTime,
                          style: Theme.of(context).textTheme.labelSmall,
                        )
                      ]
                  )
              ),
              SizedBox(height: height * 0.045,),

              //HeadLine
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Service
                  Expanded(
                    child: Text(OrdersDetailStrings.service,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),

                  // Price
                  Expanded(
                    child: Text(OrdersDetailStrings.price,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),

                ],
              ),

              SizedBox(
                height: height * 0.435,
                child: ListView.builder(
                    itemCount: orderDetailsController.orderDetailsModel.value.messages!.status!.orderdtls!.length,
                    itemBuilder: (BuildContext context, int index){

                      calculatePrice(index, orderDetails);
                      // for(int x = 0; x < orderDetails.length; x++) {
                      //     discounted = double.parse(orderDetails[index].price!) - double.parse(orderDetails[0].couponAmnt!);
                      //     gst = double.parse(orderDetailsController.orderDetailsModel.value.messages!.status!.gst!.gst!)/100;
                      //     gstPrice = discounted * gst;
                      //     totalPrice = discounted + gstPrice;
                      //     debugPrint("Discounted Price: ${discounted.toString()}");
                      //     debugPrint("GST Price: ${gstPrice.toString()}");
                      //     debugPrint("Total Price: ${totalPrice.toString()}");
                      //   // debugPrint(totalPrice.toString());
                      // }
                      return Row(
                        children: [
                          Expanded(
                              child: Text(orderDetails[index].productname!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                          ),

                          Expanded(
                              child: Text(orderDetails[index].price!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                          ),
                        ],
                      );
                    }),
              ),
              const Divider(thickness: 1.0,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(OrdersDetailStrings.totalPrice,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          SizedBox(height: height * 0.01),

                          Text(OrdersDetailStrings.discount,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          SizedBox(height: height * 0.01),

                          Text(OrdersDetailStrings.gst,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          SizedBox(height: height * 0.01),

                          FittedBox(
                            child: Text(OrdersDetailStrings.grandTotal,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                          SizedBox(height: height * 0.01),

                          FittedBox(
                            child: Text(OrdersDetailStrings.dueAmount,
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
                          Text(discounted.toString(),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: height * 0.01),

                          Text(orderDetails[0].couponAmnt.toString(),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: height * 0.01),

                          Text(orderDetailsController.orderDetailsModel.value.messages!.status!.gst!.gst!,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: height * 0.01),

                          Text(totalPrice.toString(),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: height * 0.01),
                          Text(totalPrice.toString(),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      )
                  ),
                ],
              ),
              SizedBox(height: height * 0.04),
              const Divider(thickness: 1.0),

              // Address and Service
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(OrdersDetailStrings.deliveryAddress),

                        //Name
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: OrdersDetailStrings.name,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  TextSpan(
                                    text: orderAddress[0].firstName,
                                    style: Theme.of(context).textTheme.labelSmall,
                                  )
                                ]
                            )
                        ),
                        SizedBox(height: height * 0.01),

                        //Mobile No
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: OrdersDetailStrings.mobileNo,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  TextSpan(
                                    text: orderAddress[0].number,
                                    style: Theme.of(context).textTheme.labelSmall,
                                  )
                                ]
                            )
                        ),
                        SizedBox(height: height * 0.01),
                        //Email
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: OrdersDetailStrings.email,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  TextSpan(
                                    text: orderAddress[0].email,
                                    style: Theme.of(context).textTheme.labelSmall,
                                  )
                                ]
                            )
                        ),
                        SizedBox(height: height * 0.01),
                        //Address 1
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: OrdersDetailStrings.address1,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  TextSpan(
                                    text: orderAddress[0].address1,
                                    style: Theme.of(context).textTheme.labelSmall,
                                  )
                                ]
                            )
                        ),
                        SizedBox(height: height * 0.01),
                        //Address 2
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: OrdersDetailStrings.address2,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  TextSpan(
                                    text: orderAddress[0].adress2,
                                    style: Theme.of(context).textTheme.labelSmall,
                                  )
                                ]
                            )
                        ),
                        SizedBox(height: height * 0.01),
                        //City
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: OrdersDetailStrings.city,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  TextSpan(
                                    text: orderAddress[0].cityName,
                                    style: Theme.of(context).textTheme.labelSmall,
                                  )
                                ]
                            )
                        ),
                        SizedBox(height: height * 0.01),
                        //State
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: OrdersDetailStrings.state,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  TextSpan(
                                    text: orderAddress[0].state,
                                    style: Theme.of(context).textTheme.labelSmall,
                                  )
                                ]
                            )
                        ),
                        SizedBox(height: height * 0.01),
                        //Pin
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: OrdersDetailStrings.pin,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  TextSpan(
                                    text: orderAddress[0].pincode,
                                    style: Theme.of(context).textTheme.labelSmall,
                                  )
                                ]
                            )
                        ),
                        SizedBox(height: height * 0.01),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(OrdersDetailStrings.scheduleDetails),
                          RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: OrdersDetailStrings.scheduleDate,
                                      style: Theme.of(context).textTheme.titleLarge,
                                    ),
                                    TextSpan(
                                      text: orderDetails[0].bookingDate.toString(),
                                      style: Theme.of(context).textTheme.labelSmall,
                                    )
                                  ]
                              )
                          ),
                          SizedBox(height: height * 0.01),

                          //Service Time
                          RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: OrdersDetailStrings.scheduleTime,
                                      style: Theme.of(context).textTheme.titleLarge,
                                    ),
                                    TextSpan(
                                      text: orderDetails[0].bookingTime,
                                      style: Theme.of(context).textTheme.labelSmall,
                                    )
                                  ]
                              )
                          ),
                          SizedBox(height: height * 0.01),
                        ],
                      )
                  )
                ],
              )
            ],
          ),
        ),
      );}
    );
  }
  calculatePrice(int x,List<Orderdtl> orderDetails ) {
    for(int x = 0; x < orderDetails.length; x++) {
      discounted = double.parse(orderDetails[x].price!) -
          double.parse(orderDetails[0].couponAmnt!);
      gst = double.parse(
          orderDetailsController.orderDetailsModel.value.messages!.status!
              .gst!.gst!) / 100;
      gstPrice = discounted * gst;
      totalPrice = discounted + gstPrice;
      debugPrint("Discounted Price: ${discounted.toString()}");
      debugPrint("GST Price: ${gstPrice.toString()}");
      debugPrint("Total Price: ${totalPrice.toString()}");
      // debugPrint(totalPrice.toString());
    }
  }
}
