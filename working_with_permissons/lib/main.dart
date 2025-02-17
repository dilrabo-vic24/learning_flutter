import 'package:flutter/material.dart';
import 'package:working_with_permissons/location_pick_example.dart'; // TO'G'RI IMPORT

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
      home: LocationPickExample(),
    );
  }
}
