import 'package:flutter/material.dart';
import 'waanofi_colors.dart';

/// Builds the light and dark [ThemeData] entirely from [WaanofiColors].
///
/// Uses [ColorScheme.fromSeed] as the base and then applies per-token
/// overrides so every surface, text colour, and semantic slot maps to the
/// design-system palette.
class WaanofiTheme {
  WaanofiTheme._();

  // ─────────────────────── Light ───────────────────────
  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: WaanofiColors.primary,
      brightness: Brightness.light,
    ).copyWith(
      primary: WaanofiColors.primary,
      onPrimary: WaanofiColors.surface,
      primaryContainer: WaanofiColors.primaryLight,
      secondary: WaanofiColors.secondary,
      onSecondary: WaanofiColors.textPrimary,
      surface: WaanofiColors.surface,
      onSurface: WaanofiColors.textPrimary,
      onSurfaceVariant: WaanofiColors.textSecondary,
      outline: WaanofiColors.outline,
      error: WaanofiColors.error,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: WaanofiColors.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: WaanofiColors.primary,
        foregroundColor: WaanofiColors.surface,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: WaanofiColors.secondary,
        foregroundColor: WaanofiColors.textPrimary,
      ),
      cardTheme: CardThemeData(
        color: WaanofiColors.surface,
        elevation: 8,
        shadowColor: WaanofiColors.primary.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: WaanofiColors.textSecondary.withValues(alpha: 0.05),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: WaanofiColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: WaanofiColors.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: WaanofiColors.error, width: 2),
        ),
        labelStyle: const TextStyle(color: WaanofiColors.textSecondary),
        floatingLabelStyle: const TextStyle(color: WaanofiColors.primary, fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: WaanofiColors.primary,
          foregroundColor: WaanofiColors.surface,
          elevation: 4,
          shadowColor: WaanofiColors.primary.withValues(alpha: 0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: WaanofiColors.textPrimary, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: WaanofiColors.textPrimary, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: WaanofiColors.textPrimary),
        bodyMedium: TextStyle(color: WaanofiColors.textSecondary),
        labelLarge: TextStyle(color: WaanofiColors.textPrimary, fontWeight: FontWeight.w600),
      ),
    );
  }

  // ─────────────────────── Dark ───────────────────────
  static ThemeData get dark {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: WaanofiColors.primary,
      brightness: Brightness.dark,
    ).copyWith(
      primary: WaanofiColors.primaryLight,
      onPrimary: WaanofiColors.textPrimaryDark,
      primaryContainer: WaanofiColors.primaryDark,
      secondary: WaanofiColors.secondary,
      onSecondary: WaanofiColors.textPrimary,
      surface: WaanofiColors.surfaceDark,
      onSurface: WaanofiColors.textPrimaryDark,
      onSurfaceVariant: WaanofiColors.textSecondaryDark,
      outline: WaanofiColors.outlineDark,
      error: WaanofiColors.error,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: WaanofiColors.backgroundDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: WaanofiColors.surfaceDark,
        foregroundColor: WaanofiColors.textPrimaryDark,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: WaanofiColors.secondary,
        foregroundColor: WaanofiColors.textPrimary,
      ),
      cardTheme: CardThemeData(
        color: WaanofiColors.surfaceDark,
        elevation: 8,
        shadowColor: Colors.black.withValues(alpha: 0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.black.withValues(alpha: 0.2),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: WaanofiColors.primaryLight, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: WaanofiColors.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: WaanofiColors.error, width: 2),
        ),
        labelStyle: const TextStyle(color: WaanofiColors.textSecondaryDark),
        floatingLabelStyle: const TextStyle(color: WaanofiColors.primaryLight, fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: WaanofiColors.primaryLight,
          foregroundColor: WaanofiColors.surfaceDark,
          elevation: 4,
          shadowColor: WaanofiColors.primaryLight.withValues(alpha: 0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: WaanofiColors.textPrimaryDark, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: WaanofiColors.textPrimaryDark, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: WaanofiColors.textPrimaryDark),
        bodyMedium: TextStyle(color: WaanofiColors.textSecondaryDark),
        labelLarge: TextStyle(color: WaanofiColors.textPrimaryDark, fontWeight: FontWeight.w600),
      ),
    );
  }
}
