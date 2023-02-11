import 'dart:convert';

import 'package:apniseva/model/cart_model/cart_detail_model/cart_details_model.dart';
import 'package:apniseva/model/cart_model/coupon_model/coupon_model.dart';
import 'package:apniseva/utils/api_endpoint_strings/api_endpoint_strings.dart';
import 'package:apniseva/utils/api_strings/api_strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/cart_model/add_to_cart_model/add_to_cart_model.dart';
import '../../model/cart_model/checkout_model/checkout_data_model.dart';
import '../../model/cart_model/remove_item_model/remove_items_model.dart';
import '../../screens/sucessful/screen/sucessfull_screen.dart';

class CartController extends GetxController{
  Rx isLoading = false.obs;
  String? paymentMode = "cash";
  List? productName=[];
  List? price=[];
  List? qty=[];
  List? image=[];

  Rx<AddToCartDataModel> addToCartDataModel = AddToCartDataModel().obs;
  Rx<CartDetailsDataModel> cartDetailsDataModel = CartDetailsDataModel().obs;
  Rx<RemoveItemDataModel> removeItemDataModel = RemoveItemDataModel().obs;
  Rx<CouponDataModel> couponDataModel = CouponDataModel().obs;
  Rx<CheckOutDataModel> checkoutDataModel = CheckOutDataModel().obs;

  TextEditingController couponTextController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

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
      preferences.remove(ApiStrings.catID);
      isLoading.value = false;
      return true;
  }

  getCartData() async{
    clear();
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
        isLoading.value = false;
      }


      for(int i=0; i < cartDetailsDataModel.value.messages!.status!.allCart!.length; i++){
        var cartData = cartDetailsDataModel.value.messages!.status!.allCart![i];

        productName?.add(cartData.servicename);
        image!.add(cartData.image);
        qty!.add(cartData.qty);
        price!.add(cartData.price);
      }
      // debugPrint('ProductName: ${productName.toString()}');
      // debugPrint('Image: ${image.toString()}');
      // debugPrint('Quantity: ${qty.toString()}');
      // debugPrint('Price: ${price.toString()}');


   } catch(e){
    isLoading.value = false;
    debugPrint(e.toString());
    return false;
   }

  }

  removeItem() async{
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
      }else{
        Get.snackbar('Cart', 'Cart is empty');
      }
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
        'coupon_code': couponCode
      };

      Map<String, String> header = {
        "Content-Type": "application/json; charset=utf-8"
      };

      http.Response response = await http.post(
        Uri.parse(couponAPI),
        body: jsonEncode(body),
        headers: header
      );

      debugPrint('CouponAPI: ${response.statusCode}');
      couponModel = couponDataModelFromJson(response.body);

      if(response.statusCode == 200 && couponModel.status == 200){
        couponDataModel.value = couponModel;
        preferences.setString(ApiStrings.couponCharge, couponDataModel.value.messages!.status!.couponDetails!.couponAmount!);
        preferences.setString(ApiStrings.gstAmount, couponDataModel.value.messages!.status!.gst!.gstAmount!);
      }
      isLoading.value = false;
  }

  checkOut() async{
    CheckOutDataModel checkOutModel = CheckOutDataModel();

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userID = preferences.getString(ApiStrings.userID);
    String? couponAmount = preferences.getString(ApiStrings.couponCharge);
    String? gstAmount = preferences.getString(ApiStrings.gstAmount);
    String? addressID = preferences.getString(ApiStrings.addressID);
    String? checkOutAPI = ApiEndPoint.checkout;

    Map<String, dynamic> body = {
      'user_id': userID!,
      'paymentmode': paymentMode!,
      'date': dateController.text,
      'time': timeController.text,
      'productname': productName.toString(),
      'price': price.toString(),
      'qty': qty.toString(),
      'image': image.toString(),
      'cupone_code': couponTextController.text,
      'cupone_charge': couponAmount!,
      'gst': gstAmount!,
      'address_id': addressID!
    };

    Map<String, String> headers = {
      "Content-Type": "application/json; charset=utf-8"
    };

    http.Response response = await http.post(
      Uri.parse(checkOutAPI),
      body: jsonEncode(body),
      headers: headers
    );

    debugPrint(response.body.toString());
    checkOutModel = checkOutDataModelFromJson(response.body);
    if(response.statusCode == 200 && checkOutModel.status == 200){
      checkoutDataModel.value = checkOutModel;
      Get.snackbar('Cart', 'Submitted');
    }

    clear();
  }

  clear() {
    productName!.clear();
    image!.clear();
    qty!.clear();
    price!.clear();
    image!.clear();
  }
}