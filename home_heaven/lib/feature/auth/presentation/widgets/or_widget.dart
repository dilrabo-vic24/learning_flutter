import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 10.h,
            width: 150.w,
            child: Divider(
                indent: 10.w,
                endIndent: 10.w,
                color: Colors.black)),
        const Text("OR"),
        const SizedBox(
            height: 10,
            width: 150,
            child: Divider(
                indent: 10, endIndent: 10, color: Colors.black))
      ],
    );
  }
}