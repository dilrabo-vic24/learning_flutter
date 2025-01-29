import 'dart:developer';

import 'package:exam_month_3/presentations/screens/login_screen.dart';
import 'package:exam_month_3/presentations/screens/onboarding_screen.dart';
import 'package:exam_month_3/presentations/utils/app_colors.dart';
import 'package:exam_month_3/presentations/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> waitFor() async {
    Future.delayed(Duration(seconds: 3), () async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var firstTimer = _prefs.getBool("isFirstTimer") ?? true;
      log(firstTimer.toString());
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                firstTimer ? OnboardingScreen() : LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: FutureBuilder(
        future: waitFor(),
        builder: (context, snapshot) {
          return Center(child: Image.asset(AppImages.splashScreenImage));
        },
      ),
    );
  }
}
