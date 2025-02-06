import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_heaven/core/common/widgets/custom_text_style.dart';
import 'package:home_heaven/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50.h,
          width: 250.w,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
              border: Border.all(color: AppColors.blackColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              customTextStyle(text: "Search candles"),
              Spacer(),
              Icon(Icons.camera_alt_outlined)
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none))
      ],
    );
  }
}
