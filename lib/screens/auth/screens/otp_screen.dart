import 'package:apniseva/controller/location_controller/location_controller.dart';
import 'package:apniseva/utils/api_strings/api_strings.dart';
import 'package:apniseva/utils/bottom_nav_bar.dart';
import 'package:apniseva/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/auth_controller/auth_controller.dart';
import '../../../utils/color.dart';
import '../../../utils/theme.dart';

import 'package:get/get.dart';

import '../../location/screen/location.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const OtpVerificationScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  final authController = Get.put(AuthController());
  final locController = Get.put(LocationController());


  @override
  void initState() {
    authController.getUserData();
    super.initState();
  }

  verifyOTP() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? otp = preferences.getString(ApiStrings.otp);
    String? cityID = preferences.getString(ApiStrings.cityID);

    if(otp != authController.otpController.text.toString()) {
      Get.snackbar("OTP", "Incorrect OTP");

    } else if(cityID == null) {
      // setState(() {
      authController.getUserData();
      // });
      showDialog(context: context, builder: (context) {
        return const GetLocation();
      });
    }else {
      Get.to(const BottomNavBar());

    }
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.top);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
              width: width,
              height: height,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(
                    height: height * 0.2,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text('OTP Verification',
                          style: AppTheme.lightTheme.textTheme.headlineLarge,
                        ),
                      ),
                      Text('Enter OTP sent to your mobile no ${widget.phoneNumber.toString()}',
                          style: AppTheme.lightTheme.textTheme.titleMedium
                      ),
                    ],
                  ),

                  PinCodeTextField(
                    length: 6,
                    controller: authController.otpController,
                    textStyle: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w400
                    ),
                    appContext: (context),
                    onChanged: (value) {
                      // debugPrint(value);
                      setState(() {
                        // currentText = value;
                      });},
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                        borderWidth: 1.5,
                        borderRadius: BorderRadius.circular(8),
                        activeFillColor: primaryColor,
                        selectedColor: primaryColor,
                        activeColor: Colors.black,
                        inactiveColor: Colors.black,
                        errorBorderColor: Colors.red,
                        fieldOuterPadding: EdgeInsets.zero
                    ),
                  ),
                  const SizedBox(height: 5),

                  Container(
                    width: width,
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.13),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.info_outlined,
                          color: Colors.red,
                        ),
                        SizedBox(width: 10),
                        Text('Automatically reading  OTP',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  PrimaryButton(
                      width: width,
                      height: 47,
                      onPressed: () async{
                        // SharedPreferences preferences = await SharedPreferences.getInstance();
                        // String? otp = preferences.getString(ApiStrings.otp);
                        // if(otp == authController.otpController.text.toString()) {
                        //   debugPrint(otp);
                        //   Navigator.push(context,
                        //       MaterialPageRoute(builder: (context) =>
                        //       const BottomNavBar()));
                        // } else {
                        //   Navigator.push(context,
                        //       MaterialPageRoute(builder: (context) =>
                        //       const RegistrationScreen()));
                        // }

                        verifyOTP();
                      },
                      label: 'SUBMIT'
                  ),
                  SizedBox(height: height * 0.03),

                  const Align(
                    alignment: Alignment.center,
                    child: Text('Didn\'t received OTP? ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: (){},
                        child: const Text('Resend OTP',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            )
        ),
      ),
    );
  }
}