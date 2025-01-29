import 'package:exam_month_3/presentations/screens/register_screen.dart';
import 'package:exam_month_3/presentations/utils/app_colors.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<AuthProvider>(
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
                        text: "Welcome Back!",
                        fontWeight: FontWeight.bold,
                        fontSize: 35.sp),
                    customTextStyle(
                      textAlign: TextAlign.start,
                      color: Colors.grey,
                      text:
                          "Enter your email to start shopping and get awesome deals today!",
                    ),
                    SizedBox(height: 30.h),
                    CustomTextField(
                        controller: emailController,
                        prefixIcon: Icons.email_outlined,
                        hintText: "Email"),
                    SizedBox(height: 10.h),
                    PasswordTextFormField(
                        passwordController: passwordController),
                    SizedBox(height: 10.h),
                    customTextStyle(
                        text: "Forgot your password?",
                        textAlign: TextAlign.start,
                        color: AppColors.mainColor,
                        // fontWeight: FontWeight.w200,
                        fontSize: 15.sp),
                    SizedBox(height: 10.h),
                    LoginRegisterButton(
                      authProvider: authProvider,
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      formKey: formKey,
                      text: 'Log In', isRegister: false,
                    ),
                    SizedBox(height: 20.h),
                    const OrWidget(),
                    SizedBox(height: 20.h),
                    SocialMediaWidget(
                        authProvider: authProvider,
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        formKey: formKey,
                        text: "Log in with Google",
                        iconUrl: AppIcons.googleIcon, isRegister: false,),
                    SizedBox(height: 20.h),
                    SocialMediaWidget(
                        authProvider: authProvider,
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        formKey: formKey,
                        text: "Log in with Facebook",
                        iconUrl: AppIcons.facebookIcon, isRegister: false,),
                    SizedBox(height: 20.h),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ));
                        },
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(color: Colors.grey)),
                              TextSpan(
                                  text: "Register",
                                  style: TextStyle(color: AppColors.mainColor))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
