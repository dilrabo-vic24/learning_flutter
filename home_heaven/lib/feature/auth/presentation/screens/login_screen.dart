import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_heaven/core/common/widgets/custom_text_style.dart';
import 'package:home_heaven/feature/auth/presentation/controllers/auth_controller.dart';
import 'package:home_heaven/feature/auth/presentation/screens/register_screen.dart';
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
    return Scaffold(
      body: Consumer<AuthController>(
        builder: (context, authController, child) {
          if (authController.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h  ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(hintText: "Enter phone number"),
                ),
                SizedBox(height: 10.h),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(hintText: "Enter password"),
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                    onPressed: () async {
                      await authController.loginWithPhone(
                          phoneNumber: phoneController.text.trim(),
                          password: passwordController.text.trim());
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              customTextStyle(text: authController.message)));

                      if (authController.message.contains("successfully")) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      }
                    },
                    child: customTextStyle(text: "Login")),
                SizedBox(height: 10.h),
                TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        )),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(text: "Don't have an account? "),
                      TextSpan(text: "Register")
                    ]))),
              ],
            ),
          );
        },
      ),
    );
  }
}
