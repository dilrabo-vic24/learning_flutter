import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData prefixIcon;
  final String hintText;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.prefixIcon,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      
      decoration: InputDecoration(
      
        border: OutlineInputBorder(
          
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        prefixIcon: Icon(
          prefixIcon,
        ),
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$hintText must be filled";
        }
        return null;
      },
    );
  }
}
