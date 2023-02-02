import 'package:apniseva/controller/address_controller/address_controller.dart';
import 'package:apniseva/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/address_inputfield.dart';
import '../widget/address_strings.dart';

class AddressFormScreen extends StatefulWidget {
  const AddressFormScreen({Key? key}) : super(key: key);

  @override
  State<AddressFormScreen> createState() => _AddressFormScreenState();
}

class _AddressFormScreenState extends State<AddressFormScreen> {

  final addressController = Get.put(AddressController());

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              child: Column(
                children: [
                  //First Name & Last Name
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                            children: [
                              Header(title: AddressStrings.fFirstName,),
                              const TextInputField(
                                // controller: ,
                                hintText: 'Suresh',
                                keyboardType: TextInputType.name,
                              )
                            ],
                          )
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                          child: Column(
                            children: [
                              Header(title: AddressStrings.fLastName,),
                              const TextInputField(
                                hintText: 'Kumar',
                                keyboardType: TextInputType.name,
                              )
                            ],
                          )
                      )
                    ],
                  ),

                  Header(title: AddressStrings.fEmail),
                  const TextInputField(
                    // controller: ,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'sureshkumar@gmail.com',
                  ),

                  Header(title: AddressStrings.fPhone),
                  const TextInputField(
                    // controller: ,
                    keyboardType: TextInputType.phone,
                    hintText: '1234567890',
                  ),

                  Header(title: AddressStrings.fAddress1),
                  const TextInputField(
                    maxLines: 4,
                    hintText: 'Address 1',
                    keyboardType: TextInputType.streetAddress,
                  ),

                  Header(title: AddressStrings.fAddress2),
                  const TextInputField(
                    maxLines: 4,
                    hintText: 'Address 2',
                    keyboardType: TextInputType.streetAddress,
                  ),

                  Header(title: AddressStrings.fCity),
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
                    child: Container()

                    /*DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: getLoc,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: locController.locationModel.value.messages!.status!.city!.map((items) {
                          return DropdownMenuItem(
                            onTap: () async{
                              SharedPreferences preferences = await SharedPreferences.getInstance();
                              preferences.setString(ApiStrings.cityID, items.cityId.toString());
                              preferences.setString(ApiStrings.cityName, items.cityName.toString());
                            },
                            value: items.cityName,
                            child: Text(items.cityName!,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          );}).toList(),
                        onChanged: (String? newValue) async{
                          getLoc = newValue!;
                          setState(() {

                          });
                        },
                      ),
                    ),*/
                  ),

                  Header(title: AddressStrings.fState),
                  const TextInputField(
                    hintText: 'Odisha',
                  ),

                  Header(title: AddressStrings.fPinCode),
                  const TextInputField(
                    hintText: '751016',
                  ),

                  SizedBox(height: height * 0.1)
                ]
              ),
            ),
          )
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: PrimaryButton(
          width: width * 0.95 ,
          height: 47,
          onPressed: () async {
            Future.delayed(Duration.zero, (){
              addressController.sendAddress();
            });
            super.initState();
          },
          label: 'SUBMIT'
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  const Header({Key? key,
    this.title = 'TITLE'
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(title,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
