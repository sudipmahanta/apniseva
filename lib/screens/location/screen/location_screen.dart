import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/dashboard_controller/dash_controller.dart';
import '../../../controller/location_controller/location_controller.dart';
import '../../../utils/api_strings/api_strings.dart';
import '../../../utils/buttons.dart';
import '../../../utils/color.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String getLoc = 'Khurda';

  final locController = Get.put(LocationController());
  final dashController = Get.put(DashController());

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      locController.getLoc();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              locController.isLoading.value == true ?
              Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: CircularProgressIndicator(
                      color: primaryColor,
                      strokeWidth: 2.5,
                    ),
                  )
              ):

              Container(
                height: 47,
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.shade300
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: getLoc,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: locController.locationModel.value.messages!.status!.city!.map((items) {
                      return DropdownMenuItem(
                        onTap: () async{
                          SharedPreferences preferences = await SharedPreferences.getInstance();
                          preferences.setString(ApiStrings.cityID, items.cityId.toString());
                          preferences.setString(ApiStrings.cityName, getLoc);
                          debugPrint("CityID: ${items.cityId.toString()}");
                          debugPrint("CityName: ${items.cityName.toString()}");
                        },
                        value: items.cityName,
                        child: Text(items.cityName!,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      );}).toList(),
                    onChanged: (String? newValue) async{
                      setState(() {
                        getLoc = newValue!;
                      });
                    },
                  ),
                ),
              ),

              PrimaryButton(
                  width: double.maxFinite,
                  height: 47,
                  onPressed: () {
                    setState(() {
                      dashController.getDashboard();
                    });
                    Navigator.pop(context);
                  },
                  label: 'SAVE'
              )
            ],
          ),
        );
      }
      ),
    );
  }
}
