import 'package:apniseva/controller/address_controller/address_controller.dart';
import 'package:apniseva/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/location_controller/location_controller.dart';
import '../../../utils/api_strings/api_strings.dart';
import '../widget/address_inputfield.dart';
import '../widget/address_strings.dart';

class AddressFormScreen extends StatefulWidget {
  const AddressFormScreen({Key? key}) : super(key: key);

  @override
  State<AddressFormScreen> createState() => _AddressFormScreenState();
}

class _AddressFormScreenState extends State<AddressFormScreen> {
  String? getLoc = 'Khurda';

  final formKey = GlobalKey<FormState>();
  final addressController = Get.put(AddressController());
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

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    //First Name & Last Name
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                              children: [
                                Header(title: AddressStrings.fFirstName,),
                                TextInputField(
                                  controller: addressController.firstName,
                                  validator: (value) {
                                    if(addressController.firstName.text.isEmpty){
                                      return 'Fill you name';
                                    }else{
                                      return null;
                                    }
                                  },
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
                                TextInputField(
                                  controller: addressController.lastName,
                                  hintText: 'Kumar',
                                  validator: (value) {
                                    if(addressController.lastName.text.isEmpty){
                                      return 'Fill you Last name';
                                    }else{
                                      return null;
                                    }
                                  },
                                  keyboardType: TextInputType.name,
                                )
                              ],
                            )
                        )
                      ],
                    ),

                    Header(title: AddressStrings.fEmail),
                    TextInputField(
                      controller: addressController.email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if(addressController.email.text.isEmpty){
                          return 'Fill you Email';
                        }else{
                          return null;
                        }
                      },
                      hintText: 'sureshkumar@gmail.com',
                    ),

                    Header(title: AddressStrings.fPhone),
                    TextInputField(
                      controller: addressController.phone,
                      validator: (value) {
                        if(addressController.phone.text.isEmpty){
                          return 'Fill you Mobile Number';
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.phone,
                      hintText: '1234567890',
                    ),

                    Header(title: AddressStrings.fAddress1),
                    TextInputField(
                      maxLines: 4,
                      controller: addressController.address1,
                      hintText: 'Address 1',
                      validator: (value) {
                        if(addressController.address1.text.isEmpty){
                          return 'Fill your Address';
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.streetAddress,
                    ),

                    Header(title: AddressStrings.fAddress2),
                    TextInputField(
                      maxLines: 4,
                      controller: addressController.address2,
                      hintText: 'Address 2',
                      keyboardType: TextInputType.streetAddress,
                    ),

                    Header(title: AddressStrings.fCity),
                    DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        value: getLoc,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Fill your Address';
                          }else{
                            return null;
                          }
                        },
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
                    ),

                    Header(title: AddressStrings.fState),
                    TextInputField(
                      controller: addressController.state,
                      validator: (value) {
                        if(addressController.state.text.isEmpty){
                          return 'Fill you State';
                        }else{
                          return null;
                        }
                      },
                      hintText: 'Odisha',
                    ),

                    Header(title: AddressStrings.fPinCode),
                    TextInputField(
                      controller: addressController.pinCode,
                      hintText: '751016',
                      validator: (value) {
                        if(addressController.pinCode.text.isEmpty){
                          return 'Fill you Pin-Code';
                        }else{
                          return null;
                        }
                      },
                    ),
                  ]
                ),
              ),
            ),
          )
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            width: width,
            height: 65,
            color: Colors.white,
            alignment: Alignment.center,
            child: PrimaryButton(
                width: width * 0.95,
                height: 47,
                onPressed: () async{
                  if(formKey.currentState!.validate()){
                    Future.delayed(Duration.zero, (){
                      addressController.sendAddress();
                    });
                  }
                },
                label: 'SUBMIT')
        ),
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
