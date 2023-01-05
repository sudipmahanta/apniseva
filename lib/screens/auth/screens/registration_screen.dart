import 'package:apniseva/controller/auth_controller/auth_controller.dart';
import 'package:apniseva/utils/buttons.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../utils/theme.dart';
import '../widget/auth_input_field.dart';
import 'otp_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final formKey = GlobalKey<FormState>();
  final authController = Get.put(AuthController());

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
                SizedBox(height: height * 0.15),

                Text('Let\'s get started',
                    style: AppTheme.lightTheme.textTheme.headlineLarge
                ),
                SizedBox(
                  width: width * 0.65,
                  child: Text('Enter your 10 digit mobile number to create your account or login',
                      style: AppTheme.lightTheme.textTheme.titleMedium
                  ),
                ),
                SizedBox(height: height * 0.015) ,

                Form(
                    key: formKey,
                    child: PhoneNumberVerification(
                      controller: authController.mobileController,
                    )
                ),
                SizedBox(height: height * 0.02),
                
                PrimaryButton(
                    width: width,
                    height: 47,
                    onPressed: (){
                      if(formKey.currentState!.validate()) {
                        debugPrint(authController.mobileController.text);
                        authController.loginWithOTP();
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) =>
                        //         OtpVerificationScreen(
                        //             phoneNumber: authController.mobileController.text
                        //         )
                        //     )
                        // );
                      } else {
                        return;
                      }
                    },
                    label: 'GET OTP'
                ),

                const Spacer(),
              ]
          ),
        ),
      ),
    );
  }
}
