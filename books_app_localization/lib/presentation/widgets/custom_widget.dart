import 'package:books_app_localization/presentation/widgets/custom_text_style.dart';
import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  String? text;
  Color? color;
  Color? textColor;
  CustomWidget({super.key, this.text, this.color, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          color: color ?? Colors.orange),
      child: Center(
          child: customTextStyle(
        text: text ?? "Grab now",
        fontSize: 9,
        textColor: textColor ?? Colors.white,
      )),
    );
  }
}