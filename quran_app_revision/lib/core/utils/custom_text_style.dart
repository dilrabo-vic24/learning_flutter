import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app_revision/core/utils/app_colors.dart';

Widget customTextStyle({
  required String text,
  Color? textColor,
  double? fontSize,
  FontWeight? fontWeight,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.center,
    style: TextStyle(
        color: textColor ?? AppColors.mianTextColor,
        fontSize: fontSize ?? 20.sp,
        fontWeight: fontWeight ?? FontWeight.normal),
  );
}
