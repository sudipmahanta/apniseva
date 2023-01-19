import 'package:flutter/material.dart';


class PhoneNumberVerification extends StatefulWidget {
  final TextEditingController controller;
  const PhoneNumberVerification({Key? key, required this.controller}) : super(key: key);

  @override
  State<PhoneNumberVerification> createState() => _PhoneNumberVerificationState();
}

class _PhoneNumberVerificationState extends State<PhoneNumberVerification> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.labelLarge,
      validator:  (value) {
        if(value!.isEmpty && value.length != 10){
          return 'Invalid Mobile Number';
        } else {
          return null;
        }
      },
      controller: widget.controller,
      cursorColor: Colors.black,
      cursorRadius: const Radius.circular(10),
      cursorWidth: 1.5,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      maxLines: 1,
      maxLength: 10,
      decoration: const InputDecoration(
        counterText: '',
        hintText: '333 333 3333',
      ),
    );
  }
}
