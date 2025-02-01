import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app_revision/core/utils/app_colors.dart';
import 'package:quran_app_revision/core/utils/app_images.dart';
import 'package:quran_app_revision/core/utils/custom_text_style.dart';
import 'package:quran_app_revision/feature/ayah/domain/entities/ayah_entity.dart';

class CurrentSurah extends StatelessWidget {
  final AyahDataEntity ayahDataEntity;

  const CurrentSurah({
    super.key,
    required this.ayahDataEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: AppColors.blueLight,
              offset: Offset(2, 2),
            ),
          ],
          // border: Border.all(color: AppColors.blueLight),
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          color: AppColors.mianTextColor),
      child: Row(
        children: [
          Image.asset(AppImages.bookImage, width: 150.w, height: 150.h),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customTextStyle(
                    text: ayahDataEntity.name!,
                    fontSize: 30.sp,
                    textColor: AppColors.white,
                    fontWeight: FontWeight.bold),
                SizedBox(height: 10.h),
                customTextStyle(
                    text: ayahDataEntity.englishName!,
                    textColor: AppColors.white),
                customTextStyle(
                    text:
                        "${ayahDataEntity.revelationType} ${ayahDataEntity.numberOfAyahs} VERSES",
                    textColor: AppColors.white),
              ],
            ),
          )
        ],
      ),
    );
  }
}
