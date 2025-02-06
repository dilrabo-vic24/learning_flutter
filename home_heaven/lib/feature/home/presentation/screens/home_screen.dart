import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_heaven/core/common/widgets/custom_text_style.dart';
import 'package:home_heaven/core/utils/app_colors.dart';
import 'package:home_heaven/feature/home/presentation/controllers/home_controller.dart';
import 'package:home_heaven/feature/home/presentation/widgets/banner_widget.dart';
import 'package:home_heaven/feature/home/presentation/widgets/custom_app_bar.dart';
import 'package:home_heaven/feature/home/presentation/widgets/product_card.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  int? _currentIndex;

  @override
  void initState() {
    Future.microtask(
      () async {
        await Provider.of<HomeProvider>(context, listen: false).getBanners();
        await Provider.of<HomeProvider>(context, listen: false).getProducts();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          if (homeProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: EdgeInsets.all(15.w),
              child: Column(
                children: [
                  CustomAppBar(),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(
                        width: 270.w,
                        child: customTextStyle(
                            text: "Deliver to 3517 W. Gray St. Utica, Pennsylv",
                            fontSize: 18.sp),
                      ),
                      Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 170.h,
                    child: PageView.builder(
                      itemCount: homeProvider.banners?.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return BannerWidget(
                            productBanner: homeProvider.banners!.data![index]);
                      },
                      onPageChanged: (value) {
                        setState(() {
                          _currentIndex = value;
                        });
                      },
                      controller: pageController,
                    ),
                  ),
                  if (homeProvider.banners?.data != null &&
                      homeProvider.banners!.data!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SmoothPageIndicator(
                        axisDirection: Axis.horizontal,
                        effect: const JumpingDotEffect(
                            activeDotColor: AppColors.mainColor,
                            dotHeight: 10,
                            dotWidth: 10),
                        controller: pageController,
                        count: homeProvider.banners!.data!.length,
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SizedBox(
                      height: 40.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customTextStyle(
                              text: "Special Offers",
                              textColor: AppColors.blackColor,
                              fontSize: 24.sp),
                          customTextStyle(
                              text: "See More",
                              textColor: AppColors.mainColor,
                              fontSize: 14.sp),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeProvider.products?.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        log(index.toString());
                        return ProductCard(
                          productData: homeProvider.products!.data![index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      )),
    );
  }
}
