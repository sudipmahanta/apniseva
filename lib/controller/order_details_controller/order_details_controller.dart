import 'package:apniseva/screens/orders/order_details_model/order_details_model.dart';
import 'package:apniseva/utils/api_endpoint_strings/api_endpoint_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/api_strings/api_strings.dart';


class OrderDetailsController extends GetxController{
  RxBool isLoading = false.obs;
  Rx<OrderDetailsDataModel> orderDetailsModel = OrderDetailsDataModel().obs;

  getOrderDetails() async{
    try{
      isLoading.value = true;
      OrderDetailsDataModel orderModel = OrderDetailsDataModel();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? userID = preferences.getString(ApiStrings.userID);
      String? orderID = preferences.getString(ApiStrings.orderID);

      String? orderDetailsAPI = "${ApiEndPoint.getOrderDetails}user_id=$userID&order_id=$orderID";
      debugPrint(orderDetailsAPI);

      // Map<String, String> body = {
      //   'user_id': userID!,
      //   'order_id': orderID!
      // };

      Map<String, String> headers = {
        "Content-Type": "application/json; charset=utf-8"
      };

      http.Response response = await http.post(
          Uri.parse(orderDetailsAPI),
          // body: body,
          headers: headers
      );
      orderModel = orderDetailsDataModelFromJson(response.body);

      if(response.statusCode == 200 && orderModel.status! == 200) {
        orderDetailsModel.value = orderModel;
        isLoading.value = false;
      }
      debugPrint("OrderAPI: \n ${response.statusCode}");

    } catch(error) {
      isLoading.value = false;
      Get.snackbar("Order Details", 'Something went wrong! Please try after sometime',
          colorText: Colors.black,
          backgroundColor: Colors.white54
      );
      return false;
    }
  }

}