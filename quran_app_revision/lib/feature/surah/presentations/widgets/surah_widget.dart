import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app_revision/core/utils/app_colors.dart';
import 'package:quran_app_revision/core/utils/app_images.dart';
import 'package:quran_app_revision/core/utils/custom_text_style.dart';
import 'package:quran_app_revision/feature/surah/domain/entities/all_surah_entity.dart';

class SurahWidget extends StatelessWidget {
  final AllSurahDataEntity allSurah;
  final int index;

  const SurahWidget({super.key, required this.allSurah, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Stack(children: [
                Image.asset(AppImages.frameIcon),
                Positioned(
                    top: 5.h,
                    left: 13.w,
                    child: customTextStyle(
                      text: index.toString(),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      textColor: AppColors.mianTextColor,
                    ))
              ]),
              SizedBox(width: 10.w),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                customTextStyle(
                    text: allSurah.englishName!,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.mianTextColor),
                customTextStyle(
                    text:
                        "${allSurah.revelationType!.toUpperCase()}  ${allSurah.numberOfAyahs} VERSUS",
                    fontSize: 14.sp,
                    textColor: const Color.fromARGB(255, 184, 180, 180))
              ])
            ]),
            customTextStyle(
                text: "${allSurah.name!}".substring(7),
                fontSize: 24.sp,
                fontWeight: FontWeight.w700)
          ]),
          Divider()
        ],
      ),
    );
  }
}
