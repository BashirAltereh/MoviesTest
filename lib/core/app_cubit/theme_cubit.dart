import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:golcoin_movies/core/app_cubit/theme_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState.initial());

  ThemeMode themeMode = ThemeMode.dark;

  setTheme(ThemeMode themeMode) async {
    emit(const ThemeState.initial());
    this.themeMode = themeMode;
    HapticFeedback.mediumImpact();
    emit(ThemeState.loaded(themeMode));
  }
}
