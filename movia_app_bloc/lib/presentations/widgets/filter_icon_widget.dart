import 'package:flutter/material.dart';
import 'package:movia_app_bloc/common/utils/app_colors.dart';
import 'package:movia_app_bloc/presentations/widgets/custom_text_widget.dart';

class FilterWidgets extends StatelessWidget {
  final String text;
  final String imageUrl;
  const FilterWidgets({
    super.key,
    required this.text,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Color(0xFFA0A0A0),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Image.asset(
              imageUrl,
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 10),
        CustomTextWidget(
          text: text,
          textColor: AppColors.greyTextColor,
          textSize: 12,
        )
      ],
    );
  }
}
