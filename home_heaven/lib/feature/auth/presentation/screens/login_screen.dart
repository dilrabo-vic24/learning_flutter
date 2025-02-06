import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_heaven/core/common/widgets/custom_text_style.dart';
import 'package:home_heaven/core/utils/app_colors.dart';
import 'package:home_heaven/core/utils/app_images.dart';
import 'package:home_heaven/feature/auth/presentation/controllers/auth_controller.dart';
import 'package:home_heaven/feature/auth/presentation/screens/register_screen.dart';
import 'package:home_heaven/feature/auth/presentation/widgets/custom_container.dart';
import 'package:home_heaven/feature/auth/presentation/widgets/custom_text_field.dart';
import 'package:home_heaven/feature/auth/presentation/widgets/or_widget.dart';
import 'package:home_heaven/feature/auth/presentation/widgets/password_text_field.dart';
import 'package:home_heaven/feature/home/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        Consumer<AuthController>(builder: (context, authController, child) {
      if (authController.isLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return SafeArea(
            child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.h),
                      customTextStyle(
                        text: "Welcome Back",
                        textColor: AppColors.blackColor,
                        fontSize: 32.sp,
                      ),
                      customTextStyle(
                        text:
                            "Enter your email to start shopping and get awesome deals today!",
                        textColor: AppColors.blackColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 20.sp,
                      ),
                      SizedBox(height: 50.h),
                      CustomField(
                          controller: phoneController,
                          hintText: "Enter phone number",
                          labelText: "Phone number",
                          massage: authController.message,
                          suffixIcon: Icons.phone),
                      SizedBox(height: 20.h),
                      PasswordTextField(
                        authController: authController,
                        passwordController: passwordController,
                      ),
                      SizedBox(height: 10.h),
                      customTextStyle(
                          text: "Forgot your password?",
                          textColor: AppColors.mainColor),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () async {
                          await authController.loginWithPhone(
                              phoneNumber: phoneController.text.trim(),
                              password: passwordController.text.trim());
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: customTextStyle(
                            text: authController.message,
                            textColor: AppColors.whiteColor,
                          )));
                          if (authController.message.contains("successfully")) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                          }
                          ;
                        },
                        child: CustomContainer(
                          text: "Log in",
                          color: AppColors.mainColor,
                          textColor: AppColors.whiteColor,
                          height: 40.h,
                          width: 343.w,
                          fontSize: 20.sp,
                          bordercolor: AppColors.mainColor,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      OrWidget(),
                      SizedBox(height: 20.h),
                      InkWell(
                          onTap: () {},
                          child: const CustomContainer(
                              text: "Log In with Google",
                              color: AppColors.backgroundColor,
                              textColor: AppColors.mainColor,
                              height: 48,
                              width: 343,
                              fontSize: 16,
                              bordercolor: AppColors.mainColor,
                              imagePath: AppImages.google)),
                      SizedBox(height: 20.h),
                      InkWell(
                        onTap: () {},
                        child: CustomContainer(
                          text: "Log In with Facebook",
                          color: AppColors.backgroundColor,
                          textColor: AppColors.mainColor,
                          height: 45.h,
                          width: 343.w,
                          fontSize: 16,
                          bordercolor: AppColors.mainColor,
                          imagePath: AppImages.facebook,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Center(
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen(),
                                    ));
                              },
                              child: RichText(
                                  text: const TextSpan(children: [
                                TextSpan(
                                    text: "Don't have an account? ",
                                    style:
                                        TextStyle(color: AppColors.blackColor)),
                                TextSpan(
                                    text: "Register",
                                    style:
                                        TextStyle(color: AppColors.mainColor))
                              ]))))
                    ])));
      }
    }));
  }
}
