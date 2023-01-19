import 'package:apniseva/controller/location_controller/location_controller.dart';
import 'package:apniseva/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({Key? key}) : super(key: key);

  @override
  State<GetLocation> createState() => _GetLocationState();
}


class _GetLocationState extends State<GetLocation> {
  String getLoc = 'Bhubaneswar';
  var loc = [
    'Indore',
    'Bhubaneswar',
    'bbsr',
    'Cuttack',
    'Khurda',
    'Rourkela',
    'Bherhampur',
  ];

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
            locController.isLoading.value == true ? Center(child: CircularProgressIndicator()) : Container(
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
                  value: getLoc.isEmpty ? null : getLoc,
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
                  onChanged: (String? newValue) {
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
                onPressed: (){},
                label: 'SAVE'
            )
          ],
        );
      }
    );
  }
}

