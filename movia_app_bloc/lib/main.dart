import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movia_app_bloc/controller/bloc/movie_bloc.dart';
import 'package:movia_app_bloc/controller/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movia_app_bloc/data/repos/movie_repo.dart';
import 'package:movia_app_bloc/presentations/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieBloc(MovieRepo()),
        ),
        BlocProvider(
          create: (context) => MovieDetailBloc(MovieRepo()),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: HomeScreen()),
    );
  }
}