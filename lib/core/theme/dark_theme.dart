import 'package:flutter/material.dart';
import 'package:golcoin_movies/core/theme/color_dark_scheme.dart';
import 'package:golcoin_movies/core/theme/text_theme.dart';

ThemeData _buildDarkTheme(ThemeData base) {
  return base.copyWith(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    textTheme: buildTextTheme(),
    scaffoldBackgroundColor: darkColorScheme.surfaceVariant,
    dividerTheme: DividerThemeData(
      color: darkColorScheme.surfaceVariant,
      thickness: 1.0,
    ),
    cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    ),
  );
}

ThemeData darkTheme() => _buildDarkTheme(ThemeData.dark());
