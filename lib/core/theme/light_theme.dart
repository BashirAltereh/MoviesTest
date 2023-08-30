import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/theme/color_light_scheme.dart';
import 'package:golcoin_movies/core/theme/text_theme.dart';

ThemeData _buildLightTheme(ThemeData base) {
  return base.copyWith(
    useMaterial3: true,
    textTheme: buildTextTheme(),
    dividerTheme: DividerThemeData(
      color: lightColorScheme.surfaceVariant,
      thickness: 1.0,
    ),
    scaffoldBackgroundColor: lightColorScheme.surfaceVariant,
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    ),
    typography: Typography.material2018(), colorScheme: lightColorScheme.copyWith(background: lightColorScheme.background),
  );
}

ThemeData lightTheme() => _buildLightTheme(ThemeData.light());
