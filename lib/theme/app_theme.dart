import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    textTheme: AppTextStyles.textTheme,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      background: AppColors.background,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryDark,
    textTheme: AppTextStyles.textTheme,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryDark,
      background: AppColors.backgroundDark,
    ),
  );
}

class AppTextStyles {
  static const TextTheme textTheme = TextTheme(
    bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.black54, fontSize: 14),
    displayLarge: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
  );
}
