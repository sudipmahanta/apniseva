import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneNumberVerification extends StatefulWidget {
  final TextEditingController controller;
  const PhoneNumberVerification({Key? key, required this.controller}) : super(key: key);

  @override
  State<PhoneNumberVerification> createState() => _PhoneNumberVerificationState();
}

class _PhoneNumberVerificationState extends State<PhoneNumberVerification> {

  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  bool visibility = false;
  String errorLabel ="";
  String defaultCountryCode = '+91';

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 50),
      child: Row(
        children: [
          InkWell(
            onTap: () async{
              final code = await countryPicker.showPicker(context: context);
              setState(() {
                countryCode = code;
              });
            },
            child: Container(
              height: 50,
              constraints: const BoxConstraints(
                  maxWidth: 65
              ),
              decoration: BoxDecoration(
                // color: Colors.grey.shade200,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(7)
              ),
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(countryCode != null ? countryCode!.dialCode : defaultCountryCode,
                        style: const TextStyle(
                            color: Colors.black
                        ),
                      ),
                      const SizedBox(width: 3),
                      SizedBox(
                          width: 17,
                          height: 17,
                          child: countryCode != null ? countryCode!.flagImage : const CountryCodeFlag(flagUri: 'assets/flags/in.png')
                      ),
                    ],
                  )
              ),
            ),
          ),
          const SizedBox(width: 2),
          Flexible(
            child: TextFormField(
              style: Theme.of(context).textTheme.labelLarge,
              validator: (value) {
                if(value!.isEmpty && value.length != 10){
                  errorLabel = 'Invalid Number';
                } else {
                  return null;
                }
              },
              controller: widget.controller,
              cursorColor: Colors.black,
              cursorRadius: const Radius.circular(10),
              cursorWidth: 1.5,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              maxLines: 1,
              maxLength: 10,
              decoration: const InputDecoration(
                counterText: '',
                hintText: '333 333 3333',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
