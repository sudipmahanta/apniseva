import 'package:apniseva/controller/auth_controller/auth_controller.dart';
import 'package:apniseva/screens/splash_screen/widgets/spalsh_string.dart';
import 'package:apniseva/utils/buttons.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/api_strings/api_strings.dart';
import '../../../utils/theme.dart';
import '../widget/auth_input_field.dart';
import '../widget/auth_strings.dart';
import 'otp_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _key = GlobalKey<FormState>();
  final authController = Get.put(AuthController());
  String? errorLabel;


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return  Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Image.asset(SplashStrings.apniSevaLogo),
                ),
                SizedBox(height: height * 0.10),

                Text(AuthString.getStarted,
                    style: AppTheme.lightTheme.textTheme.headlineLarge
                ),
                SizedBox(
                  width: width * 0.65,
                  child: Text(AuthString.enterMobileNo,
                      style: AppTheme.lightTheme.textTheme.titleLarge
                  ),
                ),
                SizedBox(height: height * 0.015) ,

                Form(
                    key: _key,
                    child: PhoneNumberVerification(
                      controller: authController.mobileController,
                      validator: (value) {
                        if(value!.isEmpty && value.length != 10){
                          return errorLabel = AuthString.validation;
                          // return ;
                        }
                      },
                    )
                ),
                SizedBox(height: height * 0.02),
                
                PrimaryButton(
                    width: width,
                    height: 47,
                    onPressed: () async{
                      if(_key.currentState!.validate()) {
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        preferences.setString(ApiStrings.mobile, authController.mobileController.text);
                        authController.loginWithOTP();
                        Get.to(
                            OtpVerificationScreen(
                                phoneNumber: authController.mobileController.text)
                        );
                      }else{
                        Get.snackbar('Login Error', errorLabel!);
                      }
                    },
                    label: AuthString.getOTP
                ),

                const Spacer(),
              ]
          ),
        ),
      ),
    );
  }
}
