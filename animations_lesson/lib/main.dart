import 'package:animations_lesson/animation1.dart';
import 'package:animations_lesson/animation2.dart';
import 'package:animations_lesson/examples/expilicit_anim/example2.dart';
import 'package:animations_lesson/examples/expilicit_anim/example_1.dart';
import 'package:animations_lesson/examples/expilicit_anim/loading_anim.dart';
import 'package:animations_lesson/examples/implicit_anim/animated_align.dart';
import 'package:animations_lesson/examples/implicit_anim/animated_switcher.dart';
import 'package:animations_lesson/examples/page_transition/page_transition.dart';
import 'package:animations_lesson/page_transition.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: Animation2 (),
    );
  }
}
