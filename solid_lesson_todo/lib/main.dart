import 'package:flutter/material.dart';
import 'package:ui_package/ui_package.dart';
void main()async {
  
  await init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Todo app', home: TaskScreen());
  }
}
