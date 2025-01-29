import 'package:exam_month_3/presentations/utils/app_colors.dart';
import 'package:exam_month_3/presentations/widgets/custom_text_style.dart';
import 'package:exam_month_3/presentations/widgets/product_card.dart';
import 'package:exam_month_3/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    Provider.of<ProductProvider>(context, listen: false).getAllProducts();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<ProductProvider>(
            builder: (context, productProvider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Icons (Search and Notifications)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications),
                        ),
                      ],
                    ),
                  ),

                  // Location Row
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(Icons.location_on),
                        Expanded(
                          child: FittedBox(
                            child: Text(
                              "Deliver to 3517 W. Gray St. Utica, Pennsylvania",
                              style: TextStyle(fontSize: 12.sp),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_down_outlined),
                      ],
                    ),
                  ),

                  // PageView for Banners
                  SizedBox(
                    height: 200.h,
                    child: PageView(
                      onPageChanged: (value) {
                        setState(() {
                          _currentIndex = value;
                        });
                      },
                      controller: pageController,
                      children: [
                        Image.asset(
                          "assets/images/banner.png",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Image.asset(
                          "assets/images/banner.png",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Image.asset(
                          "assets/images/banner.png",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),

                  // SmoothPageIndicator
                  if (_currentIndex != 3)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SmoothPageIndicator(
                        axisDirection: Axis.horizontal,
                        effect: const JumpingDotEffect(
                          activeDotColor: Color(0xFF0000FF),
                        ),
                        controller: pageController,
                        count: 3,
                      ),
                    ),

                  // Special Offers Title
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customTextStyle(
                            text: "Special Offers", fontSize: 16.sp),
                        customTextStyle(
                          text: "See More",
                          color: AppColors.mainColor,
                          fontSize: 14.sp,
                        ),
                      ],
                    ),
                  ),

                  // Product List
                  SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productProvider.allProducts.data!.length,
                      itemBuilder: (context, index) {
                        final product =
                            productProvider.allProducts.data![index];
                        return ProductCard(product: product);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
