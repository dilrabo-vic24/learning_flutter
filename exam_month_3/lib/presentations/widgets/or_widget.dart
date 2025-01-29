import 'package:exam_month_3/presentations/widgets/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 120.w,
          height: 1.h,
          color: Colors.grey,
        ),
        customTextStyle(text: "OR", color: Colors.grey, fontSize: 19.sp),
        Container(
          width: 120.w,
          height: 1.h,
          color: Colors.grey,
        ),
      ],
    );
  }
}
