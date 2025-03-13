import 'package:agronom_ai/widgets/bottom_nav_widget.dart';
import 'package:agronom_ai/widgets/camera_button.dart';
import 'package:agronom_ai/widgets/profile_widget.dart';
import 'package:agronom_ai/widgets/resent_searches_widget.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          ProfileSection(),
          CameraButton(),
          RecentSearches(),
          Spacer(),
          BottomNavigation(),
        ],
      ),
    );
  }
}
