import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:quran_app_revision/core/utils/app_colors.dart';
import 'package:quran_app_revision/core/utils/app_images.dart';
import 'package:quran_app_revision/core/utils/custom_text_style.dart';
import 'package:quran_app_revision/feature/ayah/presentation/screens/ayah_by_surah_screen.dart';
import 'package:quran_app_revision/feature/surah/presentations/controllers/all_surah_controller.dart';
import 'package:quran_app_revision/feature/surah/presentations/screens/another.dart';
import 'package:quran_app_revision/feature/surah/presentations/widgets/surah_widget.dart';

class SurahScreen extends StatefulWidget {
  static const path = "/surah";
  const SurahScreen({super.key});
  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    // Provider.of<AllSurahController>(context, listen: false).getAllSurah();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Image.asset(AppImages.menuIcon),
                Image.asset(AppImages.profileIcon)
              ]),
              Image.asset(AppImages.bookImage),
              SizedBox(height: 10.h),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.mianTextColor),
                      borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      color: AppColors.white.withAlpha(50)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customTextStyle(text: "Search Here"),
                        Icon(Icons.search, color: AppColors.mianTextColor)
                      ])),
              TabBar(
                controller: tabController,
                tabs: [Tab(text: "Surah"), Tab(text: "Porah")],
                labelStyle: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mianTextColor),
                unselectedLabelStyle: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 13.h),
              SizedBox(
                  width: 300.w,
                  height: 310.h,
                  child: TabBarView(controller: tabController, children: [
                    Consumer<AllSurahController>(
                        builder: (context, allSurahController, child) {
                      if (allSurahController.isLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Expanded(
                          child: ListView.builder(
                              itemCount:
                                  allSurahController.allSurah!.data!.length,
                              itemBuilder: (context, index) {
                                // log("nimadir");
                                return GestureDetector(
                                  onTap: () {
                                    final surahId = allSurahController
                                        .allSurah?.data?[index].number;

                                    if (surahId != null) {
                                      context.push(AyahScreen.path,
                                          extra: surahId);
                                    }
                                  },
                                  child: SurahWidget(
                                      allSurah: allSurahController
                                          .allSurah!.data![index],
                                      index: index),
                                );
                              }),
                        );
                      }
                    }),
                    customTextStyle(text: "Porah")
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
