import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String massage;
  final IconData suffixIcon;
  final TextEditingController? controller;

  const CustomField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.massage,
    required this.suffixIcon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(suffixIcon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return massage;
        }
        return null;
      },
    );
  }
}
