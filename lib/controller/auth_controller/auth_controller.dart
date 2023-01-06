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
    // SharedPreferences pref = await SharedPreferences.getInstance();
    isLoading.value = true;

    Map<String, String> mobileNumber = {'contact': mobileController.text.toString()};

    var body = json.encode(mobileNumber);
    var header = {
      "Content-Type": "application/json"
    };

    http.Response response = await http.post(Uri.parse(ApiStrings.registerApi),
        headers: header,
        body: body,
    );
    debugPrint('Status Code: ${response.statusCode.toString()}');
  }

  getOTP() async{
    Map<String, String> mobileNumber = {'contact_otp': mobileController.text.toString()};
    Map<String, String> status = {'status': jsonEncode(mobileNumber).toString()};
    Map<String, String> messages = {'messages': jsonEncode(status).toString()};
    var body = json.encode(messages);
    var header = {
      "Content-Type": "application/json"
    };

    http.Response response  = await http.post(
        Uri.parse(ApiStrings.registerApi),
      body: body,
      headers: header
    );

    if(response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var otp = jsonResponse['login_otp'];
      debugPrint(otp.toString());
    }
  }

  clear() {
    mobileController.clear();
  }
}

