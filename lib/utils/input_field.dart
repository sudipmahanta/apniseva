import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import 'color.dart';

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
