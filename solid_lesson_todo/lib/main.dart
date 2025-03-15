import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solid_lesson_todo/core/dependecy_injection.dart';
import 'package:solid_lesson_todo/features/get_tasks/presentations/controllers/tasks_provider.dart';
import 'package:solid_lesson_todo/features/get_tasks/presentations/screens/task_screen.dart';

void main()async {
  init();
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
    return MaterialApp(title: 'Flutter Demo', home: TaskScreen());
  }
}
