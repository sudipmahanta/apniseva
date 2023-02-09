import 'dart:convert';

import 'package:apniseva/screens/auth/model/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/api_endpoint_strings/api_endpoint_strings.dart';
import '../../utils/api_strings/api_strings.dart';

class AuthController extends GetxController {
  final mobileController = TextEditingController();
  final otpController =TextEditingController();

  RxBool isLoading = false.obs;
  Rx<UserDataModel> userModel = UserDataModel(
    messages: Messages(
      status: Status(
        fullname: 'User',
        email: 'Unverified',
        contact: 'null',
      )
    )
  ).obs;


  loginWithOTP() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLoading.value = true;

    Map<String, String> body = {'contact': mobileController.text};

    Map<String, String> header = {
      "Content-Type": "application/json"
    };

    http.Response response = await http.post(Uri.parse(ApiEndPoint.loginOtp),
        headers: header,
        body: jsonEncode(body),
    );
    Map data = jsonDecode(response.body);
    debugPrint('OtpAPI Status Code: ${response.statusCode}');

    if(response.statusCode == 200) {
      pref.setString(ApiStrings.mobile,
          data['messages']["status"]["contact_otp"].toString());

      pref.setString(ApiStrings.otp,
          data['messages']["status"]["login_otp"].toString());

      String? otp = pref.getString(ApiStrings.otp);
      debugPrint("OTP during api: ${otp.toString()}");
      isLoading.value = false;
    }else {
      Get.snackbar('OTP', 'Error occurred while sending OTP.');
    }

    otpController.clear();
  }

  getUserData() async{
    UserDataModel model = UserDataModel();

      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String mobile = pref.getString(ApiStrings.mobile)!;
      String verifyOtp = ApiEndPoint.verifyOtp;

      Map<String, String> header = {
        'Content-type': 'application/json',
      };
      Map<String, String> body = {
        'contact': mobile
      };
      debugPrint('UserDataApi: $verifyOtp');

      http.Response response = await http.post(
          Uri.parse(verifyOtp),
          body: jsonEncode(body),
          headers: header
      );
      debugPrint("GetUserResponse: ${response.body}");
      model = userDataModelFromJson(response.body);

      if (response.statusCode == 200 && model.status == 200) {
        userModel.value = model;
        pref.setString(ApiStrings.userID, userModel.value.messages!.status!.userId!);
        String? userID = pref.getString(ApiStrings.userID);
        debugPrint("User ID: $userID");
        return true;
      }
    isLoading.value = false;
  }

  clear() {
    mobileController.clear();
    otpController.clear();
  }
}

