import 'package:apniseva/utils/api_endpoint_strings/api_endpoint_strings.dart';
import 'package:apniseva/utils/api_strings/api_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/orders/order_model/order_model.dart';

class OrderController extends GetxController{
  RxBool isLoading = false.obs;
  Rx<OrderDataModel> orderDataModel = OrderDataModel().obs;

  getOrders() async{
    try{
      isLoading.value = true;
      OrderDataModel orderModel = OrderDataModel();
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? userID = pref.getString(ApiStrings.userID);
      String? orderAPI = "${ApiEndPoint.getOrder}=$userID";

      debugPrint(userID);
      debugPrint(orderAPI);

      Map<String, String> body = {
        "user_id": userID!
      };

      Map<String, String> header = {
        "Content-Type": "application/json; charset=utf-8"
      };

      http.Response response = await http.post(
        Uri.parse(orderAPI),
        // body: body
        headers: header
      );
      debugPrint('OrderAPI Status Code: ${response.statusCode}');
      orderModel = orderDataModelFromJson(response.body);

      if(response.statusCode == 200 && orderModel.status == 200) {
        orderDataModel.value = orderModel;
        isLoading.value = false;
      }
     // pref.setString(ApiStrings.orderID!, orderModel.messages!.status!.orderdtls!.toString());
      debugPrint("OrderAPI Data:\n${response.body}");

      return true;
    }catch(error) {
      isLoading.value = false;
      Get.snackbar("Orders", "Something went wrong! please try again later",
          colorText: Colors.black,
          backgroundColor: Colors.white54
      );
      return false;
    }
  }
}