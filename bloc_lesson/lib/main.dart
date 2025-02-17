import 'package:bloc_lesson/controllers/theme_bloc.dart';
import 'package:bloc_lesson/controllers/theme_state.dart';
import 'package:bloc_lesson/presentations/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Theme App',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state.themeMode,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
