import 'package:apniseva/controller/cart_controller/cart_controller.dart';
import 'package:apniseva/controller/service_controller/service_controller.dart';
import 'package:apniseva/screens/service/sections/service_appbar.dart';
import 'package:apniseva/screens/service/sections/service_strings.dart';
import 'package:apniseva/utils/api_endpoint_strings/api_endpoint_strings.dart';
import 'package:apniseva/utils/api_strings/api_strings.dart';
import 'package:apniseva/utils/color.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/service_model.dart';


class ServiceScreen extends StatefulWidget {
  final String serviceName;
  const ServiceScreen({Key? key,
    this.serviceName = "Service Name"
  }) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {

  final serviceController = Get.put(ServiceController());
  final addToCartController = Get.put(CartController());

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      serviceController.getService();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      return Scaffold(
          appBar: ServiceAppBar(title: ServiceStrings.serviceName),
          body: serviceController.isLoading.value == true ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
              strokeWidth: 1.5,
            ),
          ): SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: List.generate(serviceController.serviceDataModel.value.messages!.status!.serviceList!.length, (index) {
                    List<ServiceList> serviceData = serviceController.serviceDataModel.value.messages!.status!.serviceList!;

                    return Card(
                      elevation: 1.4,
                      child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)
                          ),
                          tileColor: Colors.grey.shade200,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              height: 60,
                              width: 60,
                              padding: const EdgeInsets.all(5.0),
                              child: Image.network('${ApiEndPoint.imageAPI}/${serviceData[index].serviceImage}',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          title: RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: serviceData[index].serviceName,
                                        style: TextStyle(
                                            fontSize: Theme.of(context).textTheme.labelMedium!.fontSize,
                                            color: Theme.of(context).textTheme.titleSmall!.color,
                                            fontWeight: Theme.of(context).textTheme.headlineLarge!.fontWeight
                                        )
                                    ),
                                    TextSpan(
                                        text: ' ₹${serviceData[index].amount}',
                                        style: Theme.of(context).textTheme.bodyMedium
                                    )
                                  ]
                              )
                          ),
                          subtitle: Text(serviceData[index].serviceDetails!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          trailing: InkWell(
                            onTap: () async{
                              SharedPreferences preferences = await SharedPreferences.getInstance();
                              preferences.setString(ApiStrings.serviceID, serviceData[index].serviceId!);
                              preferences.setString(ApiStrings.catID, serviceData[index].catId!);
                              preferences.setString(ApiStrings.productQty, '1');
                              Future.delayed(Duration.zero, (){
                                addToCartController.addToCart();
                              });
                            },
                            child: Container(
                                height: 40,
                                width: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(8.0)
                                ),
                                child: Icon(Icons.add_shopping_cart_rounded,
                                  color: Colors.white,
                                  size: Theme.of(context).textTheme.headlineLarge!.fontSize,
                                )
                            ),
                          )
                      ),
                    );
                  }
                  ),
                )
            ),
            ),
      );
      }
    );
  }
}
