import 'dart:convert';

import 'package:apniseva/screens/dashboard/models/dash_model.dart';
import 'package:apniseva/utils/api_endpoint_strings/api_endpoint_strings.dart';
import 'package:apniseva/utils/api_strings/api_strings.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DashController extends GetxController {

  Rx isLoading = false.obs;
  Rx<DashDataModel> dashDataModel = DashDataModel().obs;

  getDashboard() async{
   try{
     isLoading.value = true;
     DashDataModel dashModel = DashDataModel();

     SharedPreferences pref = await SharedPreferences.getInstance();
     String? cityID = pref.getString(ApiStrings.cityID);
     String? userID = pref.getString(ApiStrings.userID);
     String? dashApi = ApiEndPoint.getDash;
     debugPrint('City ID: $cityID');
     debugPrint('User ID: $userID');
     debugPrint('DashBoardAPI: $dashApi');

     Map<String, String> body = {
       "user_id" : userID!,
       "city_id" : cityID!
     };
     Map<String, String> header = {
       "Content-Type": "application/json; charset=utf-8"
     };

     http.Response response = await http.post(
       Uri.parse(dashApi),
       body: jsonEncode(body),
       headers: header
     );
     debugPrint('DashAPI Status Code: ${response.statusCode.toString()}');
     dashModel = dashDataModelFromJson(response.body);

     if(response.statusCode == 200 && dashModel.status == 200){
       dashDataModel.value = dashModel;
       isLoading.value = false;
     }
     // debugPrint('DashBoardAPI Data:\n${response.body}');

     return true;
   } catch(error) {
     isLoading.value = false;
     Get.snackbar("Dashboard", "Something went wrong! please try again later",
         colorText: Colors.black,
         backgroundColor: Colors.white54
     );
     return false;
   }
  }
}