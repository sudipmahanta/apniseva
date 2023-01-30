import 'dart:convert';

import 'package:apniseva/screens/cart/models/add_to_cart_model.dart';
import 'package:apniseva/utils/api_endpoint_strings/api_endpoint_strings.dart';
import 'package:apniseva/utils/api_strings/api_strings.dart';
import 'package:apniseva/utils/api_strings/api_strings.dart';
import 'package:apniseva/utils/api_strings/api_strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController{
  Rx isLoading = false.obs;
  Rx<AddToCartDataModel> addToCartDataModel = AddToCartDataModel().obs;

  addToCart() async{
    try{
      isLoading.value = true;
      AddToCartDataModel addToCartModel = AddToCartDataModel();

      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? userID = preferences.getString(ApiStrings.userID);
      String? serviceID = preferences.getString(ApiStrings.serviceID);
      String? categoryID = preferences.getString(ApiStrings.categoryID);

      String? addToCartAPI = ApiEndPoint.addToCart;

      Map<String, String> body = {
        'user_id': userID!,
        'service_id': serviceID!,
        'category_id': categoryID!
      };

      Map<String, String> headers = {
        "Content-Type": "application/json; charset=utf-8"
      };

      http.Response response = await http.post(
        Uri.parse(addToCartAPI),
        body: jsonEncode(body),
        headers: headers
      );
      debugPrint('Add To Cart API Status Code:${response.statusCode}' );
      addToCartModel = addToCartDataModelFromJson(response.body);

      if(response.statusCode == 200 && addToCartModel.status == 200){
        addToCartDataModel.value = addToCartModel;
        isLoading.value = false;
      }
      return true;
    }catch(e){
      isLoading.value = false;
      Get.snackbar('Add to Cart', 'Something went wrong',
          colorText: Colors.black,
          backgroundColor: Colors.white54
      );
      return false;
    }
  }

  getCartData() {

  }

}