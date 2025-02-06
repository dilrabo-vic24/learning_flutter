import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_heaven/core/common/widgets/custom_text_style.dart';
import 'package:home_heaven/core/utils/app_colors.dart';
import 'package:home_heaven/feature/home/domain/entities/banner_entity.dart';

class BannerWidget extends StatelessWidget {
  final BannerDataEntity productBanner;
  const BannerWidget({
    super.key,
    required this.productBanner,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://e-commerce.birnima.uz${productBanner.image!}"),

          fit: BoxFit
              .cover, // Rasmni konteynerga to'g'ri kelish usulini belgilaydi
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment(0.00, 0.00),
            end: Alignment(0.4, 0.5),
            colors: [Color(0xEF156650), Color(0xAA156650), Color(0x00156650)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              SizedBox(
                width: 180.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customTextStyle(
                        text: productBanner.title!,
                        textColor: AppColors.whiteColor,
                        fontSize: 20.sp),
                    customTextStyle(
                        text: productBanner.shortDescription!,
                        textColor: AppColors.whiteColor,
                        fontSize: 18.sp),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.whiteColor),
                          onPressed: () {},
                          child: customTextStyle(
                              text: "Shop Now",
                              textColor: AppColors.mainColor,
                              fontSize: 18.sp)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
