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
import '../../splash_screen/widgets/spalsh_string.dart';
import '../widget/auth_strings.dart';

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

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Image.asset(SplashStrings.apniSevaLogo),
                  ),
                  SizedBox(height: height * 0.10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(AuthString.otpVerification,
                          style: AppTheme.lightTheme.textTheme.headlineLarge,
                        ),
                      ),
                      Text('${AuthString.enterOTP} +91- ${widget.phoneNumber.toString()}',
                          style: AppTheme.lightTheme.textTheme.titleLarge
                      ),
                    ],
                  ),

                  PinCodeTextField(
                    cursorColor: Theme.of(context).primaryColor,
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
                        activeColor: primaryColor,
                        inactiveColor: primaryColor,
                        errorBorderColor: primaryColor,
                        fieldOuterPadding: EdgeInsets.zero
                    ),
                  ),
                  SizedBox(height: height * 0.05),

                  PrimaryButton(
                      width: width,
                      height: 47,
                      onPressed: () {
                        verifyOTP();
                      },
                      label: AuthString.submit
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
                        onPressed: (){
                          authController.loginWithOTP();
                        },
                        child:  Text('Resend OTP',

                          style: Theme.of(context).textTheme.labelLarge
                        )
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child:  Text('Edit Mobile Number',
                            style: Theme.of(context).textTheme.labelSmall
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