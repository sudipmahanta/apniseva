import 'dart:convert';

import 'package:apniseva/screens/orders/order_details_model/order_details_model.dart';
import 'package:apniseva/utils/api_endpoint_strings/api_endpoint_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/api_strings/api_strings.dart';


class OrderDetailsController extends GetxController{
  RxBool isLoading = false.obs;
  Rx<OrderDetailDataModel> orderDetailsModel = OrderDetailDataModel().obs;

  getOrderDetails() async{
    try{
      isLoading.value = true;
      OrderDetailDataModel orderModel = OrderDetailDataModel();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? userID = preferences.getString(ApiStrings.userID);
      String? orderID = preferences.getString(ApiStrings.orderID);

      String? orderDetailsAPI = ApiEndPoint.getOrderDetails;
      debugPrint(orderDetailsAPI);

      Map<String, String> body = {
        'user_id': userID!,
        'order_id': orderID!
      };

      Map<String, String> headers = {
        "Content-Type": "application/json; charset=utf-8"
      };

      http.Response response = await http.post(
          Uri.parse(orderDetailsAPI),
          body: jsonEncode(body),
          headers: headers
      );
      debugPrint("Status Code: ${response.statusCode.toString()}");
      orderModel = orderDetailDataModelFromJson(response.body);

      if(response.statusCode == 200 && orderModel.status! == 200) {
        orderDetailsModel.value = orderModel;
        isLoading.value = false;
      }


    } catch(e) {
      isLoading.value = false;
      debugPrint(e.toString());
      // Get.snackbar("Order Details", e.toString(),
      //     colorText: Colors.black,
      //     backgroundColor: Colors.white54
      // );
      return false;
    }
  }

}