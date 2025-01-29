import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTextStyle({required String text, Color? color, double? fontSize, FontWeight? fontWeight, TextAlign? textAlign}){
  return Text(
    text,
    maxLines: 6,
    textAlign: textAlign?? TextAlign.center ,
    style: TextStyle(
      color: color?? Colors.black,
      fontWeight: fontWeight?? FontWeight.normal,
      fontSize: fontSize?? 20.sp,
    ),
  );
}