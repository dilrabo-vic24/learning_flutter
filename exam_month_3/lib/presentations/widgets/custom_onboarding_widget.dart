import 'package:exam_month_3/presentations/widgets/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnboardingWidget extends StatelessWidget {
  final String image;
  final PageController pageViewController;
  final String mainText;
  final String subTextl;
  String? buttonText;
  Color? buttonColor;
  double? buttonWidth;

  CustomOnboardingWidget({
    super.key,
    required this.mainText,
    required this.subTextl,
    this.buttonColor,
    this.buttonText,
    this.buttonWidth,
    required this.pageViewController,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60.r),
                bottomRight: Radius.circular(60.r)),
            child: Image.asset(image)),
        Spacer(),
        SizedBox(
          height: 100.h,
          width: 300.w,
          child: customTextStyle(
              text: mainText, fontWeight: FontWeight.bold, fontSize: 35.sp),
        ),
        SizedBox(width: 300.w, child: customTextStyle(text: subTextl)),
      ],
    );
  }
}
