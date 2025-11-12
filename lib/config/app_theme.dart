import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      background: AppColors.bg,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.bg,

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColors.textPrimary,
        shadowColor: Colors.black12,
      ),

      // ⛳ FIX: CardThemeData (bukan CardTheme)
      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 2,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColors.border),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(color: AppColors.textSecondary),
        hintStyle: const TextStyle(color: AppColors.textSecondary),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.focus, width: 1.8),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.primary),
          foregroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        ),
      ),

      // ⛳ FIX: pakai MaterialStateProperty & hapus 'elevation'
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: AppColors.primary.withOpacity(0.10),
        surfaceTintColor: Colors.transparent,
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>(
          (states) => TextStyle(
            fontWeight: states.contains(MaterialState.selected)
                ? FontWeight.w700
                : FontWeight.w500,
            color: states.contains(MaterialState.selected)
                ? AppColors.primary
                : AppColors.textSecondary,
          ),
        ),
        iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>(
          (states) => IconThemeData(
            color: states.contains(MaterialState.selected)
                ? AppColors.primary
                : AppColors.textSecondary,
          ),
        ),
      ),

      dividerColor: AppColors.border,
      splashColor: AppColors.primary.withOpacity(0.08),

      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
          color: AppColors.textPrimary,
        ),
        headlineMedium: TextStyle(
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
          color: AppColors.textPrimary,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        bodyLarge: TextStyle(color: AppColors.textPrimary, height: 1.35),
        bodyMedium: TextStyle(color: AppColors.textSecondary, height: 1.35),
        labelLarge: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
