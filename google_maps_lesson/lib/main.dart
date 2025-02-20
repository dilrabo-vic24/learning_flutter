import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_lesson/draw_polyline.dart';
import 'package:google_maps_lesson/google_map_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GoogleMapScreen(),
    );
  }
} 