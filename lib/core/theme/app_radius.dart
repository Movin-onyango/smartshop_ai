import 'package:flutter/widgets.dart';

/// Centralized border radius definitions for SmartShop AI.
///
/// All rounded corners in the application should come from this class.
/// Avoid using BorderRadius.circular() directly in widgets.
class AppRadius {
  AppRadius._();

  // ==========================================================
  // Radius Values
  // ==========================================================

  static const double none = 0;

  static const double xs = 4;

  static const double sm = 8;

  static const double md = 12;

  static const double lg = 16;

  static const double xl = 20;

  static const double xxl = 24;

  static const double pill = 999;

  // ==========================================================
  // BorderRadius Objects
  // ==========================================================

  static const BorderRadius radiusXS = BorderRadius.all(Radius.circular(xs));

  static const BorderRadius radiusSM = BorderRadius.all(Radius.circular(sm));

  static const BorderRadius radiusMD = BorderRadius.all(Radius.circular(md));

  static const BorderRadius radiusLG = BorderRadius.all(Radius.circular(lg));

  static const BorderRadius radiusXL = BorderRadius.all(Radius.circular(xl));

  static const BorderRadius radiusXXL = BorderRadius.all(Radius.circular(xxl));

  static const BorderRadius radiusPill = BorderRadius.all(
    Radius.circular(pill),
  );
}
