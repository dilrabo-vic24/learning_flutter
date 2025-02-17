import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class LoadThemeEvent extends ThemeEvent {
  final ThemeMode themeMode;

  LoadThemeEvent({required this.themeMode});
}

class ChangeThemeEvent extends ThemeEvent {
  final ThemeMode themeMode;
  ChangeThemeEvent(this.themeMode);
}
