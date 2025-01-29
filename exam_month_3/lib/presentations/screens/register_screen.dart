import 'package:exam_month_3/presentations/utils/app_icons.dart';
import 'package:exam_month_3/presentations/widgets/custom_text_form_field.dart';
import 'package:exam_month_3/presentations/widgets/custom_text_style.dart';
import 'package:exam_month_3/presentations/widgets/login_register_widget.dart';
import 'package:exam_month_3/presentations/widgets/or_widget.dart';
import 'package:exam_month_3/presentations/widgets/password_text_form_field.dart';
import 'package:exam_month_3/presentations/widgets/social_media_widget.dart';
import 'package:exam_month_3/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firsNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    firsNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return Padding(
            padding: EdgeInsets.all(15.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  customTextStyle(
                      text: "Create Account",
                      fontWeight: FontWeight.bold,
                      fontSize: 35.sp),
                  customTextStyle(
                    textAlign: TextAlign.start,
                    color: Colors.grey,
                    text:
                        "Fill in your details below to get started on a seamless shopping experience.",
                  ),
                  SizedBox(height: 30.h),
                  CustomTextField(
                      controller: firsNameController,
                      prefixIcon: Icons.person_outline,
                      hintText: "First Name"),
                  SizedBox(height: 10.h),
                  CustomTextField(
                      controller: lastNameController,
                      prefixIcon: Icons.person_outline,
                      hintText: "Last Name"),
                  SizedBox(height: 10.h),
                  CustomTextField(
                      controller: emailController,
                      prefixIcon: Icons.email_outlined,
                      hintText: "Email"),
                  SizedBox(height: 10.h),
                  PasswordTextFormField(passwordController: passwordController),
                  SizedBox(height: 10.h),
                  customTextStyle(
                      text:
                          "By clicking Create Account, you acknowledge you have read and agreed to our Terms of Use and Privacy Policy",
                      textAlign: TextAlign.start,
                      color: Colors.grey,
                      fontSize: 15.sp),
                  SizedBox(height: 10.h),
                  LoginRegisterButton(
                    authProvider: authProvider,
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    formKey: formKey,
                    text: 'Create Account',
                    isRegister: true,
                  ),
                  SizedBox(height: 20.h),
                  const OrWidget(),
                  SizedBox(height: 20.h),
                  SocialMediaWidget(
                    authProvider: authProvider,
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    formKey: formKey,
                    text: "Continue with Google",
                    iconUrl: AppIcons.googleIcon,
                    isRegister: true,
                  ),
                  SizedBox(height: 20.h),
                  SocialMediaWidget(
                    authProvider: authProvider,
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    formKey: formKey,
                    text: "Continue with Facebook",
                    iconUrl: AppIcons.facebookIcon,
                    isRegister: true,
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
