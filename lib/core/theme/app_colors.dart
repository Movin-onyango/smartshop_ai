import 'package:flutter/material.dart';

/// Centralized color palette for SmartShop AI.
///
/// All colors used throughout the application should come from this class.
/// Avoid hardcoding colors in widgets.
class AppColors {
  AppColors._();

  // ============================================================
  // Brand Colors
  // ============================================================

  static const Color primary = Color(0xFF2563EB);
  static const Color primaryLight = Color(0xFF60A5FA);
  static const Color primaryDark = Color(0xFF1D4ED8);

  // ============================================================
  // Accent Colors
  // ============================================================

  static const Color secondary = Color(0xFF14B8A6);
  static const Color secondaryLight = Color(0xFF5EEAD4);
  static const Color secondaryDark = Color(0xFF0F766E);

  // ============================================================
  // Background
  // ============================================================

  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Colors.white;
  static const Color surfaceVariant = Color(0xFFF1F5F9);

  // ============================================================
  // Text
  // ============================================================

  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textHint = Color(0xFF94A3B8);
  static const Color textInverse = Colors.white;

  // ============================================================
  // Borders & Dividers
  // ============================================================

  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFCBD5E1);

  // ============================================================
  // Status Colors
  // ============================================================

  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF0EA5E9);

  // ============================================================
  // Inventory Status
  // ============================================================

  static const Color inStock = Color(0xFF22C55E);
  static const Color lowStock = Color(0xFFF59E0B);
  static const Color outOfStock = Color(0xFFDC2626);

  // ============================================================
  // Dashboard KPI Cards
  // ============================================================

  static const Color salesCard = Color(0xFF3B82F6);
  static const Color profitCard = Color(0xFF10B981);
  static const Color expenseCard = Color(0xFFEF4444);
  static const Color inventoryCard = Color(0xFFF59E0B);

  // ============================================================
  // AI Module
  // ============================================================

  static const Color aiPrimary = Color(0xFF7C3AED);
  static const Color aiSecondary = Color(0xFFA78BFA);

  // ============================================================
  // Miscellaneous
  // ============================================================

  static const Color shadow = Color(0x1A000000);
  static const Color disabled = Color(0xFFCBD5E1);
  static const Color transparent = Colors.transparent;
}
