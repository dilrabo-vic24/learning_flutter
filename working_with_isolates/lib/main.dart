import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:working_with_isolates/provider.dart';
import 'package:working_with_isolates/sort_numbers_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => SortNumbersProvider(),
    child: const MyApp()));
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
      home: SortNumbersScreen(),
    );
  }
}