import 'package:exam_month_3/presentations/screens/home_screen.dart';
import 'package:exam_month_3/presentations/utils/app_colors.dart';
import 'package:exam_month_3/presentations/widgets/custom_text_style.dart';
import 'package:exam_month_3/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({
    super.key,
    required this.formKey,
    required this.text,
    required this.iconUrl,
    required this.authProvider,
    required this.email,
    required this.password,
    required this.isRegister,
  });

  final GlobalKey<FormState> formKey;
  final String iconUrl;
  final String text;
  final AuthProvider authProvider;
  final String email;
  final String password;
  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          // backgroundColor: AppColors.mainColor,
          elevation: 4,
          fixedSize: Size(330.w, 45.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
              side: BorderSide(color: AppColors.mainColor, width: 1.h))),
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          if (isRegister) {
            await authProvider.register(email: email, password: password);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          } else {
            bool response =
                await authProvider.login(email: email, password: password);
            if (response) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: customTextStyle(
                    text: "You do not have an account. Please, register first"),
                backgroundColor: Colors.red,
              ));
            }
          }
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconUrl),
          SizedBox(width: 3.w),
          customTextStyle(
              text: text,
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}
