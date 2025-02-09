import 'package:flutter/material.dart';

class CustomTextStyle extends StatelessWidget {
  final String text;
  final double fontSize;
  const CustomTextStyle(
      {super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.black,
      ),
    );
  }
}
