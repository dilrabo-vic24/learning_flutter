import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_lesson/controllers/theme_bloc.dart';
import 'package:bloc_lesson/controllers/theme_event.dart';
import 'package:bloc_lesson/controllers/theme_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              const Text(
                "Select theme",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 15,
                children: [
                  Text("Light"),
                  BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      return Switch(
                        value: state.themeMode == ThemeMode.dark,
                        onChanged: (value) {
                          context.read<ThemeBloc>().add(ChangeThemeEvent(
                              value ? ThemeMode.dark : ThemeMode.light));
                        },
                      );
                    },
                  ),
                  const Text("Dark")
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<ThemeBloc>()
                      .add(ChangeThemeEvent(ThemeMode.system));
                },
                child: Text("System mode"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
