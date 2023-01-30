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

  Future<void> refresh() async {
    return  Future.delayed(Duration.zero,() {
      orderDetailsController.getOrderDetails();
    });
  }


  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);

    return Obx(() {
      List<Orderdtl> orderDetails = orderDetailsController.orderDetailsModel.value.messages!.status!.orderdtls!;
      List<AddOrderdtl> addOrderDetails = orderDetailsController.orderDetailsModel.value.messages!.status!.addOrderdtls!;
      List<Address> orderAddress = orderDetailsController.orderDetailsModel.value.messages!.status!.address!;

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
        RefreshIndicator(
          onRefresh: refresh,
          color: Theme.of(context).primaryColor,
          strokeWidth: 2.0,
          child: ListView(
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
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

                        Text(orderDetails[0].createdDate!,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),

                    Visibility(
                      visible: orderDetails[0].verifyOtp == '1' ? false : true,
                      child: Container(
                        // height: 50,
                        width: 80,
                        padding: const EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          children: [
                            Text('OTP',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(orderDetails[0].verifyOtp!,
                              style: TextStyle(
                                fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
                                color: const Color(0xFF0FFA4E)
                              ),
                            )
                          ],
                        ),

                      ),
                    )
                    ],
                ),
              ),
              SizedBox(height: height * 0.045,),

              // HeadLine
              const ProductHeader(),
              Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orderDetailsController.orderDetailsModel.value.messages!.status!.orderdtls!.length,
                      itemBuilder: (BuildContext context, int index){

                        calculatePrice(index, orderDetails);
                        return Row(
                          children: [
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                                  child: Text(orderDetails[index].productname!,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context).textTheme.labelLarge,
                                  ),
                                )
                            ),

                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(orderDetails[index].price!,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                )
                            ),
                          ],
                        );
                      }),
                ],
              ),

              Visibility(
                visible: addOrderDetails.isNotEmpty? true : false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          color: Colors.grey.shade200,
                          child: Text('Additional Products',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                              color: Theme.of(context).textTheme.titleMedium!.color

                            ),
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: orderDetailsController.orderDetailsModel.value.messages!.status!.addOrderdtls!.length,
                            itemBuilder: (BuildContext context, int index){

                              calculatePrice(index, orderDetails);
                              return Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                                        child: Text(addOrderDetails[index].addServiceDetails!,
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.labelLarge,
                                        ),
                                      )
                                  ),

                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(addOrderDetails[index].addServicePrice!,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context).textTheme.labelLarge,
                                        ),
                                      )
                                  ),
                                ],
                              );
                            }),
                      ],
                    ),
                  )
              ),
              const Divider(thickness: 1.0,),

              // Transaction Details
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
              SizedBox(height: height * 0.04,),

              AddressDetails(getAddress: orderAddress[0]),

              OrderSchedule(getOrderSchedule: orderDetails[0]),
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


class ProductHeader extends StatelessWidget {
  const ProductHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Row(
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
    );
  }
}

class AddressDetails extends StatelessWidget {
  final Address? getAddress;
  const AddressDetails({Key? key,
    this.getAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              // color: Colors.grey.shade50,
              child: Text('Address Details',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
                  color: Theme.of(context).textTheme.titleLarge!.color
                ),
              ),
            ),
            Divider(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getAddress!.firstName!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(getAddress!.number!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(getAddress!.email!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(getAddress!.address1!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(getAddress!.adress2!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(getAddress!.state!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(getAddress!.pincode!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class OrderSchedule extends StatelessWidget {
  final Orderdtl? getOrderSchedule;
  const OrderSchedule({Key? key, this.getOrderSchedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              // color: Colors.grey.shade50,
              child: Text('Schedule At',
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
                    color: Theme.of(context).textTheme.titleLarge!.color
                ),
              ),
            ),
            const Divider(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getOrderSchedule!.bookingDate!.toLocal().toString(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(getOrderSchedule!.bookingTime.toString(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

