import 'dart:ui';

/// Single source of truth for every colour in the Waanofi Dairy design system.
///
/// No `Colors.*` reference should appear anywhere outside this file.
/// This is enforced by the CI grep check in `scripts/check_color_usage.sh`
/// and the analysis_options.yaml lint comment convention.
class WaanofiColors {
  WaanofiColors._(); // prevent instantiation

  // ───────────────── Brand ─────────────────
  static const Color primary = Color(0xFF1B5E20);      // Deep green — dairy pasture
  static const Color primaryDark = Color(0xFF0D3B13);   // Dark forest green
  static const Color primaryLight = Color(0xFF4CAF50);  // Lush green accent

  // ───────────────── Accent ─────────────────
  static const Color secondary = Color(0xFFFFC107);     // Golden amber — fresh butter

  // ───────────────── Surface / Background ─────────────────
  static const Color surface = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF5F5F0);    // Warm off-white

  // ───────────────── Outline ─────────────────
  static const Color outline = Color(0xFFBDBDBD);

  // ───────────────── Text ─────────────────
  static const Color textPrimary = Color(0xFF1C1C1E);
  static const Color textSecondary = Color(0xFF6B7280);

  // ───────────────── Semantic ─────────────────
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFF9A825);
  static const Color error = Color(0xFFC62828);

  // ───────────────── Dark-mode overrides ─────────────────
  static const Color surfaceDark = Color(0xFF121212);
  static const Color backgroundDark = Color(0xFF1E1E1E);
  static const Color outlineDark = Color(0xFF424242);
  static const Color textPrimaryDark = Color(0xFFF5F5F5);
  static const Color textSecondaryDark = Color(0xFF9CA3AF);
}
