import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTextStyle({
  required String text,
  double? fontSize,
  FontWeight? fontWeight,
  Color? textColor,
}) {
  return Text(
    text,
    maxLines: 2,
    style: TextStyle(
      color: textColor ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontSize: fontSize ?? 20.sp,
    ),
  );
}
