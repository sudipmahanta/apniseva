import 'package:apniseva/controller/location_controller/location_controller.dart';
import 'package:apniseva/utils/api_strings/api_strings.dart';
import 'package:apniseva/utils/buttons.dart';
import 'package:apniseva/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({Key? key,
  }) : super(key: key);

  @override
  State<GetLocation> createState() => _GetLocationState();
}


class _GetLocationState extends State<GetLocation> {
  String getLoc = 'Khurda';
  String cityId = '26';

  final locController = Get.put(LocationController());

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      locController.getLoc();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return SimpleDialog(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          title: Text('Location',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
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
            ): Container(
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
                  value: getLoc.isEmpty ? 'Select your City' : getLoc,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: locController.locationModel.value.messages!.status!.city!
                    .map((items) {
                    return DropdownMenuItem(
                      value: items.cityName,
                      child: Text(items.cityName!,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) async{
                    setState(() {
                      getLoc = newValue!;
                    });
                    cityId = locController.locationModel.value.messages!.status!.city!.map((getCityID) => getCityID.cityId!).toString();
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    pref.setString(ApiStrings.cityName, getLoc);
                    pref.setString(ApiStrings.cityID, '23');
                  },
                ),
              ),
            ),
            PrimaryButton(
                width: double.maxFinite,
                height: 47,
                onPressed: () async{
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  String? cityName = pref.getString(ApiStrings.cityName);
                  String? cityID = pref.getString(ApiStrings.cityID);
                  debugPrint('City Name: $cityName');
                  debugPrint('CityID: $cityID');
                },
                label: 'SAVE'
            )
          ],
        );
      }
    );
  }
}

