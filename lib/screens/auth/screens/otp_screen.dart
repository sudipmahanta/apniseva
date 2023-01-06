import 'package:apniseva/utils/bottom_nav_bar.dart';
import 'package:apniseva/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/color.dart';
import '../../../utils/theme.dart';
import '../../dashboard/screens/dashboard_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const OtpVerificationScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
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
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: AssetImage(backgroundImage))
              // ),
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
                    textStyle: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w400
                    ),
                    appContext: (context),
                    onChanged: (value) {
                      debugPrint(value);
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
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavBar()));
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
