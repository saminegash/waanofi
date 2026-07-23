import 'package:flutter/material.dart';
import 'waanofi_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle displayLarge = TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary);
  static const TextStyle displayMedium = TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: WaanofiColors.textPrimary);
  static const TextStyle displaySmall = TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: WaanofiColors.textPrimary);
  
  static const TextStyle titleLarge = TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: WaanofiColors.textPrimary);
  static const TextStyle titleMedium = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: WaanofiColors.textPrimary);
  static const TextStyle titleSmall = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: WaanofiColors.textPrimary);

  static const TextStyle bodyLarge = TextStyle(fontSize: 16, color: WaanofiColors.textPrimary);
  static const TextStyle bodyMedium = TextStyle(fontSize: 14, color: WaanofiColors.textSecondary);
  static const TextStyle bodySmall = TextStyle(fontSize: 12, color: WaanofiColors.textSecondary);
}
