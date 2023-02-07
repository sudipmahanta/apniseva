import 'package:flutter/material.dart';

class SucessfullScreen extends StatefulWidget {
  const SucessfullScreen({Key? key}) : super(key: key);

  @override
  State<SucessfullScreen> createState() => _SucessfullScreenState();
}

class _SucessfullScreenState extends State<SucessfullScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: const Text('Request sent successfully'),
      ),
    );
  }
}
