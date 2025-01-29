import 'package:exam_month_3/presentations/screens/login_screen.dart';
import 'package:exam_month_3/presentations/utils/app_colors.dart';
import 'package:exam_month_3/presentations/utils/app_images.dart';
import 'package:exam_month_3/presentations/widgets/custom_onboarding_widget.dart';
import 'package:exam_month_3/presentations/widgets/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageViewController = PageController();

  int? _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              controller: pageViewController,
              children: [
                CustomOnboardingWidget(
                  image: AppImages.image1,
                  pageViewController: pageViewController,
                  mainText: "Online Home Store and Furniture",
                  subTextl:
                      "Discover all style and budgets of furniture, appliances, kitchen, and more from 500+ brands in your hand.",
                ),
                CustomOnboardingWidget(
                  image: AppImages.image2,
                  pageViewController: pageViewController,
                  mainText: "Delivery Right to Your Doorstep",
                  subTextl:
                      "Sit back, and enjoy the convenience of our drivers delivering your order to your doorstep.",
                ),
                CustomOnboardingWidget(
                  image: AppImages.image3,
                  pageViewController: pageViewController,
                  mainText: "Get Support From Our Skilled Team",
                  subTextl:
                      "If our products don't meet your expectations, we're available 24/7 to assist you.",
                ),
              ],
            ),
          ),
          if (_currentIndex != 3)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: SmoothPageIndicator(
                controller: pageViewController,
                count: 3,
                axisDirection: Axis.horizontal,
                effect: JumpingDotEffect(
                    activeDotColor: AppColors.mainColor,
                    dotHeight: 8.h,
                    dotWidth: 8.w),
              ),
            ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                fixedSize: Size(300.w, 40.h),
                backgroundColor: AppColors.mainColor,
              ),
              onPressed: () {
                if (_currentIndex == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                }
                pageViewController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut);
              },
              child: customTextStyle(
                text: "Next",
              )),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
