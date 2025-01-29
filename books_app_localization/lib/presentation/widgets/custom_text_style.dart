import 'package:flutter/material.dart';

Widget customTextStyle({
  required String text,
  Color? textColor,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    maxLines: 5,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: textColor ?? Colors.black,
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.bold,
    ),
  );
}
