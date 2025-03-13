import 'package:flutter/material.dart';

class CameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 170,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green[400],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(Icons.camera_alt_outlined, color: Colors.white, size: 32),
    );
  }
}
