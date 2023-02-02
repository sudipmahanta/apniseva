import 'package:flutter/material.dart';


class TextInputField extends StatelessWidget {
  final int maxLines;
  final TextEditingController? controller;
  final String hintText;
  final TextInputType keyboardType;
  const TextInputField({Key? key,
    this.maxLines = 1,
    this.controller,
    this.hintText = 'HintText',
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: hintText
        ),
      ),
    );
  }
}
