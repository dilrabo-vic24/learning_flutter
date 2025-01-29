import 'package:exam_month_3/data/models/product_model.dart';
import 'package:exam_month_3/presentations/widgets/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final Datum product;
  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      padding: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Column(
        children: [
          Image.network(product.image![0]),
          Row(
            children: [
              customTextStyle(text: product.name!),
              Container(
                color: const Color(0xFFFF0000),
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: customTextStyle(text: "${product.discount.toString()} %"),
              ),
            ],
          ),
          customTextStyle(text: "\$${product.price! * (1 - product.discount!/100)}"),

          customTextStyle(text: "\$ ${product.price.toString()}", fontSize: 13.sp),
          Row(
            children: [
              const Icon(Icons.star, color: Color(0xFFFF8C00)),
              customTextStyle(text: product.rating.toString()),
              customTextStyle(text: product.quintity.toString()),
            ],
          )
        ],
      ),
    );
  }
}
