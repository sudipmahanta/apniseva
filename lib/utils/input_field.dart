import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.text,
        style: Theme.of(context).textTheme.labelLarge,
        cursorRadius: const Radius.circular(8),
        cursorColor: Colors.black,
        cursorWidth: 1.6,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          hintText: 'AC repair, Washing Machine . . .',
          hintStyle: Theme.of(context).textTheme.titleMedium,
          prefixIcon: const Icon(Remix.search_2_line),
        ),
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  const TextInput({Key? key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.hintText = "hintText"
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.labelLarge,
      cursorRadius: const Radius.circular(8),
      cursorColor: Colors.black,
      cursorWidth: 1.8,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleMedium,
        // prefixIcon: const Icon(Remix.search_2_line),
      ),
    );
  }
}


