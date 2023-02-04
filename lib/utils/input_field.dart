import 'package:apniseva/controller/dashboard_controller/dash_controller.dart';
import 'package:apniseva/screens/dashboard/models/dash_model.dart';
import 'package:apniseva/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:remixicon/remixicon.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {

  final searchController = Get.put(DashController());

  @override
  Widget build(BuildContext context) {
    return Card(
      child: /*TypeAheadFormField<SearchDtl?>(
        suggestionsCallback: SearchApi.getSearchResult,
        itemBuilder: (context, SearchDtl? suggestion) {
          final search = suggestion;
          return ListTile(
            title: Text(search!.serviceName!),
          );
        },
        onSuggestionSelected: (SearchDtl? suggestion) {

        },
        noItemsFoundBuilder: (context) => const Text('No Service'),
      ),*/

      TextFormField(
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


class PickerInputField extends StatefulWidget {
  final String pick;
  final double? width;
  final TextEditingController? controller;
  final String? hintText;
  final IconData? prefixIcon;
  const PickerInputField({Key? key,
    required this.pick, this.controller, this.prefixIcon, this.width, this.hintText}) : super(key: key);

  @override
  State<PickerInputField> createState() => _PickerInputFieldState();
}

class _PickerInputFieldState extends State<PickerInputField> {
  Future<void> reminderDate(String pick) async{
    if(pick == 'Date') {
      DateTime initialDate = DateTime.now();
      DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: initialDate,
          lastDate: DateTime(4000),
          firstDate: initialDate);
      if(pickedDate != null) {
        String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
        setState(() {
          widget.controller?.text = formattedDate; //set output date to TextField value.
        });
      }else {
        widget.controller!.text =  DateFormat('dd-MM-yyyy').format( DateTime.now()).toString();
      }
    }else if (pick == 'Time') {
      TimeOfDay? initialTime = TimeOfDay.now();
      TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: initialTime,
          initialEntryMode: TimePickerEntryMode.dial
      );
      if(pickedTime != null) {
        setState(() {
          widget.controller!.text = pickedTime.format(context); //set output date to TextField value.
        });
      }else {
        widget.controller!.text =  TimeOfDay.now().toString();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: TextFormField(
        onTap: () {
          reminderDate(widget.pick.toString());
        },
        controller: widget.controller,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: primaryColor,
        cursorWidth: 1.5,
        cursorHeight: 20,
        readOnly: true,
        cursorRadius: const Radius.circular(8),
        validator: (value){
          if(value == null || value.isEmpty){
            return 'Please Enter ${widget.hintText}';
          }else{
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: Icon(widget.prefixIcon,
            size: 20,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}