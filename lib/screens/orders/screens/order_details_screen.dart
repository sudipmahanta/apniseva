import 'package:apniseva/controller/order_details_controller/order_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../profile/profile_sections/profile_app_bar.dart';
import '../order_details_model/order_details_model.dart';
import '../order_model/order_model.dart';
import '../order_widget/order_strings.dart';

class OrderBookingDetails extends StatefulWidget {
  const OrderBookingDetails({Key? key}) : super(key: key);

  @override
  State<OrderBookingDetails> createState() => _OrderBookingDetailsState();
}

class _OrderBookingDetailsState extends State<OrderBookingDetails> {

  final orderDetailsController = Get.put(OrderDetailsController());

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
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
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
                                    text: orderDetailsController.orderDetailsModel.value.messages!.status!.otherDtl!.orderId,
                                    style: Theme.of(context).textTheme.labelSmall,
                                  )
                                ]
                            )
                        ),
                        SizedBox(height: height * 0.005),

                        Text(orderDetailsController.orderDetailsModel.value.messages!.status!.otherDtl!.bookingDate!,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),

                    Visibility(
                      visible: orderDetailsController.orderDetailsModel.value.messages!.status!.otherDtl!.verifyOtp!.isEmpty &&
                          orderDetailsController.orderDetailsModel.value.messages!.status!.otherDtl!.verifyOtp == '1' ? true : false,
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
                            Text(orderDetailsController.orderDetailsModel.value.messages!.status!.otherDtl!.verifyOtp!,
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
              SizedBox(height: height * 0.045),

              // HeadLine
              const ProductHeader(),
              Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orderDetailsController.orderDetailsModel.value.messages!.status!.allOrders!.length,
                      itemBuilder: (BuildContext context, int index){
                        List<AllOrder>? allOrders = orderDetailsController.orderDetailsModel.value.messages!.status!.allOrders!;
                        return Row(
                          children: [
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                                  child: Text(allOrders[index].productName!,
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context).textTheme.labelLarge,
                                  ),
                                )
                            ),

                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text("₹ ${allOrders[index].price!}",
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
                visible:  orderDetailsController.orderDetailsModel.value.messages!.status!.additinalOrders!.isEmpty ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: double.maxFinite,
                          color: Colors.grey.shade200,
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                            itemCount: orderDetailsController.orderDetailsModel.value.messages!.status!.additinalOrders!.length,
                            itemBuilder: (BuildContext context, int index){

                              return Row(
                                children: [
                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                                        child: Text(orderDetailsController.orderDetailsModel.value.messages!.status!.additinalOrders![index].productName!,
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context).textTheme.labelLarge,
                                        ),
                                      )
                                  ),

                                  Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text("₹ ${orderDetailsController.orderDetailsModel.value.messages!.status!.additinalOrders![index].price!}",
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
                          ),

                          SizedBox(height: height * 0.01),

                          FittedBox(
                            child: Text(OrdersDetailStrings.paidAmount,
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
                          Text('₹ ${orderDetailsController.orderDetailsModel.value.messages!.status!.otherDtl!.totalPrice.toString()}',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: height * 0.01),

                          Text('₹ ${orderDetailsController.orderDetailsModel.value.messages!.status!.otherDtl!.discount.toString()}',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: height * 0.01),

                          Text('₹ ${orderDetailsController.orderDetailsModel.value.messages!.status!.otherDtl!.gst}',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: height * 0.01),

                          Text('₹ ${orderDetailsController.orderDetailsModel.value.messages!.status!.otherDtl!.grandTotal.toString()}',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: height * 0.01),
                          Text('₹ ${orderDetailsController.orderDetailsModel.value.messages!.status!.otherDtl!.dueAmount.toString()}',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: height * 0.01),
                          Text('₹ ${orderDetailsController.orderDetailsModel.value.messages!.status!.otherDtl!.paidAmount}',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),

                        ],
                      )
                  ),
                ],
              ),
              SizedBox(height: height * 0.04,),

              AddressDetails(getAddress: orderDetailsController.orderDetailsModel.value.messages!.status!.address!),

              OrderSchedule(getOrderSchedule: orderDetailsController.orderDetailsModel.value.messages!.status!.otherDtl!),
              SizedBox(height: height * 0.05,)
            ],
          ),
        ),
      );}
    );
  }
}


class ProductHeader extends StatelessWidget {
  const ProductHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
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
  final List<Address>? getAddress;
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
            const Divider(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getAddress![0].firstName!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(getAddress![0].number!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(getAddress![0].email!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(getAddress![0].address1!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(getAddress![0].adress2!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(getAddress![0].state!,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(getAddress![0].pincode!,
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
  final OtherDtl? getOrderSchedule;
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
                  Text("Schedule Date: ${getOrderSchedule!.bookingDate}",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text("Schedule Time: ${getOrderSchedule!.bookingTime}",
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