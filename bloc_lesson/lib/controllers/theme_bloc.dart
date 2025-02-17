import 'package:bloc_lesson/controllers/theme_event.dart';
import 'package:bloc_lesson/controllers/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeMode: ThemeMode.system)) {
    on<LoadThemeEvent>(onLoadTheme);
    on<ChangeThemeEvent>(onChangeTheme);
  }

 Future<void> onLoadTheme(
    LoadThemeEvent event, Emitter<ThemeState> emit) async {
  final prefs = await SharedPreferences.getInstance();
  int? themeIndex = prefs.getInt("themeKey");

  ThemeMode themeMode = ThemeMode.system;
  if (themeIndex != null) {
    themeMode = ThemeMode.values[themeIndex];
  }

  emit(ThemeState(themeMode: themeMode));
}


  Future<void> onChangeTheme(
      ChangeThemeEvent event, Emitter<ThemeState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("themeKey", event.themeMode.index);
    emit(ThemeState(themeMode: event.themeMode));
  }
}
