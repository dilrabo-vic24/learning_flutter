import 'package:auth_firebase/presentations/widgets/custom_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextStyle(
              text: "Home Screen",
              fontSize: 35,
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.currentUser?.delete();
              },
              child: CustomTextStyle(text: "Sign out", fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
