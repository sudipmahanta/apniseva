import 'dart:convert';

import 'package:apniseva/utils/api_strings/api_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final mobileController = TextEditingController();
  final otpController =TextEditingController();

  RxBool isLoading = false.obs;

  loginWithOTP()  async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLoading.value = true;

    Map mobileNumber = {'contact': mobileController.text.toString()};
    debugPrint(mobileNumber.toString());
    var body = jsonEncode(mobileNumber);

    http.Response response = await http.post(
        Uri.parse(ApiStrings.registerApi),
        body: body
    );
    debugPrint('Status Code: ${response.statusCode.toString()}');
    debugPrint('Body: ${response.body}');

    var data = jsonDecode(response.body);
    var otp = data['otp'];
    if(response.statusCode == 200 && data['status']==true) {
      Get.snackbar('Success', data['message']);
      clear();
    }

  }

  clear() {
    mobileController.clear();
  }
}

