import 'dart:convert';

import 'package:apniseva/utils/api_endpoint_strings/api_endpoint_strings.dart';
import 'package:apniseva/utils/api_strings/api_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../screens/location/location_model/location_model.dart';

class LocationController extends GetxController {

  RxBool isLoading = false.obs;
  Rx<LocationModel> locationModel = LocationModel().obs;

  getLoc() async{
    isLoading.value = true;
    try {
      LocationModel locModel = LocationModel();

      SharedPreferences pref = await SharedPreferences.getInstance();
      String? id = pref.getString(ApiStrings.userID);

      Map<String, String> header = {
        'Content-type': 'application/json; charset=utf-8',
      };

      String url = "${ApiEndPoint.getLoc}=$id";
      debugPrint(url);

      http.Response response = await http.post(
          Uri.parse(url),
          headers: header
      );
      locModel = locationModelFromJson(response.body);
      var data = jsonDecode(response.body);
      if(data["status"] == 200){
        locationModel.value = locModel;
      }
      debugPrint(response.body.toString());
      debugPrint(response.body.runtimeType.toString());

      isLoading.value = false;
      return true;
    } catch(e) {
      isLoading.value = false;
      Get.snackbar("Error", "Something went wrong! please try again later",
          colorText: Colors.black,
          backgroundColor: Colors.white54
      );
      debugPrint(e.toString());
      return false;
    }
  }
}