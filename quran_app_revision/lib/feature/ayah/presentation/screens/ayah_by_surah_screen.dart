import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quran_app_revision/core/utils/app_colors.dart';
import 'package:quran_app_revision/core/utils/app_images.dart';
import 'package:quran_app_revision/feature/ayah/presentation/controller/ayah_controller.dart';
import 'package:quran_app_revision/feature/ayah/presentation/widgets/ayah_by_surah_widget.dart';
import 'package:quran_app_revision/feature/ayah/presentation/widgets/current_surah.dart';

class AyahScreen extends StatefulWidget {
  const AyahScreen({super.key});
  @override
  State<AyahScreen> createState() => _AyahScreenState();
}

class _AyahScreenState extends State<AyahScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      AppColors.blueLight,
                      const Color.fromARGB(255, 62, 109, 212),
                      AppColors.blueLight,
                      const Color.fromARGB(255, 62, 109, 212),
                      AppColors.blueLight,
                    ])),
                child: SingleChildScrollView(child: Consumer<AyahController>(
                    builder: (context, ayahController, child) {
                  if (ayahController.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(AppImages.menuIcon),
                              Image.asset(AppImages.profileIcon)
                            ]),
                        SizedBox(height: 10.h),
                        CurrentSurah(
                          ayahDataEntity: ayahController.ayahBySurah.data!,
                        ),
                        SizedBox(height: 10.h),
                        SizedBox(
                          height: 430.h,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: ayahController
                                  .ayahBySurah.data!.ayahs!.length,
                              itemBuilder: (context, index) {
                                return AyahBySurahWidget(
                                    allAyahEntity: ayahController.allAyahBySurah
                                        .data!.surahs![1].ayahs![index],
                                    ayahEntity: ayahController
                                        .ayahBySurah.data!.ayahs![index],
                                    index: index);
                              }),
                        )
                      ]);
                })))));
  }
}
