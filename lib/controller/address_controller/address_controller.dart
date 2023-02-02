import 'dart:convert';

import 'package:apniseva/utils/api_endpoint_strings/api_endpoint_strings.dart';
import 'package:apniseva/utils/api_strings/api_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressController extends GetxController{
  RxBool isLoading = false.obs;

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController address1 = TextEditingController();
  final TextEditingController address2 = TextEditingController();
  // final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController pinCode = TextEditingController();
  // final TextEditingController = TextEditingController();

sendAddress() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? userID = preferences.getString(ApiStrings.userID);
  String? cityName = preferences.getString(ApiStrings.cityName);
  String? addressAPI = ApiEndPoint.addressAPI;

  try{
    isLoading.value = true;
    Map<String, String> body = {
      'user_id': userID!,
      'firstname': firstName.text,
      'lastname': lastName.text,
      'email': email.text,
      'phone': phone.text,
      'address1': address1.text,
      'address2': address2.text,
      'city': cityName!,
      'state': state.text,
      'zip': pinCode.text,
    };

    Map<String, String> headers = {
      "Content-Type": 'application/json'
    };

    http.Response response = await http.post(
      Uri.parse(addressAPI),
      body: jsonEncode(body),
      headers: headers
    );
    debugPrint(response.body);

  }catch(e){
    Get.snackbar('Address', 'Something went wrong!');

  }

}
}