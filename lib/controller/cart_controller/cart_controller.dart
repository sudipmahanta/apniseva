import 'dart:convert';

import 'package:apniseva/screens/cart/models/cart_details_model.dart';
import 'package:apniseva/screens/cart/models/coupon_model.dart';
import 'package:apniseva/utils/api_endpoint_strings/api_endpoint_strings.dart';
import 'package:apniseva/utils/api_strings/api_strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/cart/models/add_to_cart_model.dart';
import '../../screens/cart/models/remove_items_model.dart';

class CartController extends GetxController{
  Rx isLoading = false.obs;
  Rx<AddToCartDataModel> addToCartDataModel = AddToCartDataModel().obs;
  Rx<CartDetailsDataModel> cartDetailsDataModel = CartDetailsDataModel().obs;
  Rx<RemoveItemDataModel> removeItemDataModel = RemoveItemDataModel().obs;
  Rx<CouponDataModel> couponDataModel = CouponDataModel().obs;

  TextEditingController couponTextController = TextEditingController();

  addToCart() async{
    // try{
      isLoading.value = true;
      AddToCartDataModel addToCartModel = AddToCartDataModel();

      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? userID = preferences.getString(ApiStrings.userID);
      String? serviceID = preferences.getString(ApiStrings.serviceID);
      String? categoryID = preferences.getString(ApiStrings.catID);
      String? productQty = preferences.getString(ApiStrings.productQty);

      String? addToCartAPI = ApiEndPoint.addToCart;

      Map<String, String> body = {
        'user_id': userID!,
        'service_id': serviceID!,
        'category_id': categoryID!,
        'product_qty': productQty!,
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
        Get.snackbar('Cart', addToCartDataModel.value.messages!.status.toString(),
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM
        );
      }
      return true;
    // }catch(e){
    //   isLoading.value = false;
    //   Get.snackbar('Add to Cart', 'Something went wrong',
    //       colorText: Colors.black,
    //       backgroundColor: Colors.white54
    //   );
    //   return false;
    // }
  }

  getCartData() async{
    try{
      isLoading.value = true;
      CartDetailsDataModel cartModel = CartDetailsDataModel();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? userID = preferences.getString(ApiStrings.userID);
      String? cityID = preferences.getString(ApiStrings.cityID);
      String? cartAPI = ApiEndPoint.cartDetails;

      Map<String, String> body = {
        'user_id': userID!,
        'city_id': cityID!
      };

      Map<String, String> headers = {
        "Content-Type": "application/json; charset=utf-8"
      };

      http.Response response = await http.post(
          Uri.parse(cartAPI),
          body: jsonEncode(body),
          headers: headers
      );

      debugPrint(response.statusCode.toString());
      cartModel = cartDetailsDataModelFromJson(response.body);

      if(response.statusCode == 200 && cartModel.status == 200){
        cartDetailsDataModel.value = cartModel;
      }

      isLoading.value = false;
      return true;
    }catch(e){
      isLoading.value = false;
      Get.snackbar('Cart', 'Something went wrong',
          colorText: Colors.black,
          backgroundColor: Colors.white54
      );
      return false;
    }
  }

  removeItem() async{
    // try{
      isLoading.value = true;
      RemoveItemDataModel removeItemModel = RemoveItemDataModel();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? cartID = preferences.getString(ApiStrings.cartID);
      String? removeItemAPI = ApiEndPoint.removeItems;

      Map<String, String> body = {
        'cart_id': cartID!
      };

      Map<String, String> headers = {
        "Content-Type": "application/json; charset=utf-8"
      };

      http.Response response = await http.post(
        Uri.parse(removeItemAPI),
        body: jsonEncode(body),
        headers: headers
      );
      debugPrint('RemoveItem: ${response.statusCode}');
      removeItemModel = removeItemDataModelFromJson(response.body);

      if(response.statusCode == 200 && removeItemModel.status == 200){
        removeItemDataModel.value == removeItemModel;
        Get.snackbar('Cart', removeItemDataModel.value.messages!.status.toString());
      }
      isLoading.value = false;
    // }catch(e){
    //   isLoading.value = false;
    //   Get.snackbar('Service Remove', 'Something went wrong!');
    // }
  }

  applyCoupon() async{
    // try{
      isLoading.value = true;
      SharedPreferences preferences = await SharedPreferences.getInstance();
      CouponDataModel couponModel = CouponDataModel();

      String? userID = preferences.getString(ApiStrings.userID);
      String? cityID = preferences.getString(ApiStrings.cityID);
      String? couponCode = couponTextController.text;
      String? couponAPI = ApiEndPoint.applyCoupon;

      Map<String, String> body = {
        'user_id': userID!,
        'city_id': cityID!,
        'coupon_id': couponCode
      };

      Map<String, String> header = {
        "Content-Type": "application/json; charset=utf-8"
      };

      http.Response response = await http.put(
        Uri.parse(couponAPI),
        body: jsonEncode(body),
        headers: header
      );

      debugPrint('CouponAPI: ${response.statusCode}');
      couponModel = couponDataModelFromJson(response.body);

      if(response.statusCode == 200 && couponModel.status == 200){
        couponDataModel.value = couponModel;
      }
      isLoading.value = false;
  }
}