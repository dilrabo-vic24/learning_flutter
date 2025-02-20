import 'package:flutter/material.dart';
import 'package:movia_app_bloc/common/utils/app_colors.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;

  Color? textColor;
  double? textSize;
  FontWeight? fontWeight;
  TextAlign? textAlign;

  CustomTextWidget({
    super.key,
    required this.text,
    this.fontWeight,
    this.textAlign,
    this.textColor,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
        color: textColor ?? AppColors.whiteColor,
        fontSize: textSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
