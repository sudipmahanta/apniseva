import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final VoidCallback onPressed;
  final String label;
  const PrimaryButton({Key? key, required this.width, required this.height, this.borderRadius = 8, required this.onPressed, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)
          )
          // backgroundColor:
        ),
          child: Text(label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600
            ),
          ),
      ),
    );
  }
}