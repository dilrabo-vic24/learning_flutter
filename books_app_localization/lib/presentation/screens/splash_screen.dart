import 'dart:developer';

import 'package:books_app_localization/presentation/screens/books_screen.dart';
import 'package:books_app_localization/presentation/screens/onboarding_screen.dart';
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
    Future.delayed(
      Duration(seconds: 3),
      () async {
        SharedPreferences _prefs = await SharedPreferences.getInstance();

        var firstTimer = _prefs.getBool("isFirstTimer") ?? true;
        log(firstTimer.toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                firstTimer ? OnboardingScreen() : BooksScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: waitFor(),
        builder: (context, snapshot) {
          return Image.asset(
            width: double.infinity,
            fit: BoxFit.cover,
            "assets/images/splash_pic.png",
          );
        },
      ),
    );
  }
}
