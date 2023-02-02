import 'dart:convert';

import 'package:apniseva/screens/auth/model/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/api_endpoint_strings/api_endpoint_strings.dart';
import '../../utils/api_strings/api_strings.dart';

class AuthController {
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
    String? mobileNumber = pref.getString(ApiStrings.mobile);
    isLoading.value = true;

    Map<String, String> body = {'contact': mobileNumber!};

    Map<String, String> header = {
      "Content-Type": "application/json"
    };

    http.Response response = await http.post(Uri.parse(ApiEndPoint.loginOtp),
        headers: header,
        body: jsonEncode(body),
    );
    var data = jsonDecode(response.body);
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
    try{
      isLoading.value = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? mobile = pref.getString(ApiStrings.mobile);

      Map<String, String> header = {
        'Content-type': 'application/json',
      };
      Map<String, String> body = {
        'contact': mobile!
      };

      String userDataAPI = ApiEndPoint.verifyOtp;
      debugPrint('UserDataApi: $userDataAPI');

      http.Response response = await http.post(
          Uri.parse(userDataAPI),
          body: jsonEncode(body),
          headers: header
      );
      // debugPrint("GetUserData: ${response.body}");
      model = userDataModelFromJson(response.body);

      if (response.statusCode == 200 && model.status == 200) {
        userModel.value = model;
        pref.setString(ApiStrings.userID, userModel.value.messages!.status!.userId!.toString());
        String? userID = pref.getString(ApiStrings.userID);
        debugPrint("User ID: $userID");
        isLoading.value = false;

        return true;
      } else {
        isLoading.value = false;
        Get.snackbar('Auth', 'Something went wrong! Please try again later');
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Auth", "Something went wrong! please try again later",
        colorText: Colors.black,
        backgroundColor: Colors.white54
      );
      debugPrint(e.toString());
      return false;
    }
  }

  clear() {
    mobileController.clear();
    otpController.clear();
  }
}

