import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_heaven/core/common/widgets/custom_text_style.dart';
import 'package:home_heaven/core/utils/app_colors.dart';
import 'package:home_heaven/core/utils/app_images.dart';
import 'package:home_heaven/feature/auth/presentation/controllers/auth_controller.dart';
import 'package:home_heaven/feature/auth/presentation/widgets/custom_container.dart';
import 'package:home_heaven/feature/auth/presentation/widgets/custom_text_field.dart';
import 'package:home_heaven/feature/auth/presentation/widgets/or_widget.dart';
import 'package:home_heaven/feature/auth/presentation/widgets/password_text_field.dart';
import 'package:home_heaven/feature/home/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Consumer<AuthController>(
          builder: (context, authController, child) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 15.h),
                    customTextStyle(
                        text: "Create Account",
                        textColor: AppColors.blackColor,
                        fontSize: 32.sp),
                    customTextStyle(
                        text:
                            "Fill in your details below to get started on a seamless shopping experience.",
                        textColor: AppColors.blackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp),
                    SizedBox(height: 30.h),
                    CustomField(
                        hintText: "Enter your firstName",
                        labelText: "FirstName",
                        massage: "Please enter",
                        suffixIcon: Icons.person_2_outlined,
                        controller: emailController),
                    SizedBox(height: 15.h),
                    CustomField(
                        hintText: "Enter your phone",
                        labelText: "Phone Number",
                        massage: "Please enter",
                        suffixIcon: Icons.phone,
                        controller: phoneNumberController),
                    SizedBox(height: 15.h),
                    PasswordTextField(
                        authController: authController,
                        passwordController: passwordController),
                    SizedBox(height: 30.h),
                    customTextStyle(
                        text:
                            "By clicking Create Account, you acknowledge you have read and agreed to our Terms of Use and Privacy Policy",
                        textColor: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () async {
                        await authController.register(
                          phoneNumber: phoneNumberController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: customTextStyle(
                            text: authController.message,
                            textColor: AppColors.whiteColor,
                          )));
                        if (authController.message.contains("successfully")) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        }
                      },
                      child: CustomContainer(
                          isLoading: authController.isLoading,
                          text: "Create Account",
                          color: AppColors.mainColor,
                          textColor: AppColors.whiteColor,
                          height: 50,
                          width: 343,
                          fontSize: 16,
                          bordercolor: AppColors.mainColor),
                    ),
                    SizedBox(height: 20.h),
                    const OrWidget(),
                    SizedBox(height: 20.h),
                    InkWell(
                        onTap: () {},
                        child: const CustomContainer(
                            text: "Log In with Google",
                            color: AppColors.backgroundColor,
                            textColor: AppColors.mainColor,
                            height: 50,
                            width: 343,
                            fontSize: 16,
                            bordercolor: AppColors.mainColor,
                            imagePath: AppImages.google)),
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: () {},
                      child: const CustomContainer(
                        text: "Log In with Facebook",
                        color: AppColors.backgroundColor,
                        textColor: AppColors.mainColor,
                        height: 50,
                        width: 343,
                        fontSize: 16,
                        bordercolor: AppColors.mainColor,
                        imagePath: AppImages.facebook,
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
