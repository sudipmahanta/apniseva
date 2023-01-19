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

  String? phone;
  String? otp;

  loginWithOTP() async{
    SharedPreferences pref = await SharedPreferences.getInstance();

    isLoading.value = true;
    Map<String, String> mobileNumber = {'contact': mobileController.text.toString()};
    var body = json.encode(mobileNumber);
    var header = {
      "Content-Type": "application/json"
    };

    http.Response response = await http.post(Uri.parse(ApiEndPoint.registerApi),
        headers: header,
        body: body,
    );
    var data = jsonDecode(response.body);
    debugPrint('Status Code: ${response.statusCode.toString()}');
    pref.setString(ApiStrings.mobile, data['messages']["status"]["contact_otp"]);
    var getPhone = data['messages']["status"]["contact_otp"].toString();
    phone = getPhone;

    var getOtp = data['messages']["status"]["login_otp"].toString();
    otp = getOtp;
    mobileController.clear();
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
      String userDataAPI = '${ApiEndPoint.getUser}=$mobile';
      debugPrint('UserDataApi: $userDataAPI');

      http.Response response = await http.post(
          Uri.parse(userDataAPI),
          headers: header
      );
      debugPrint(response.body.toString());
      model = userDataModelFromJson(response.body);
      debugPrint(model.messages!.status!.userId.toString());

      if (response.statusCode == 200 && model.status == 200) {
        userModel.value = model;
        pref.setString(ApiStrings.userID, userModel.value.messages!.status!.userId!.toString());
        isLoading.value = false;
        return true;
      } else {
        isLoading.value = false;
        Get.snackbar('Error', 'Something went wrong! Please try again later');
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", "Something went wrong! please try again later",
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

