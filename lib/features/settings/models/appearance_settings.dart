/// ---------------------------------------------------------------------------
/// AppearanceSettings
/// ---------------------------------------------------------------------------
///
/// Stores application appearance preferences used throughout SmartShop AI.
/// ---------------------------------------------------------------------------
class AppearanceSettings {
  const AppearanceSettings({
    this.themeMode = 'system',
    this.primaryColor = 'green',
    this.useMaterial3 = true,
    this.compactLayout = false,
  });

  /// Application theme mode.
  ///
  /// Supported values:
  /// - system
  /// - light
  /// - dark
  final String themeMode;

  /// Primary application accent color.
  final String primaryColor;

  /// Whether Material 3 components are enabled.
  final bool useMaterial3;

  /// Whether compact layouts should be used.
  final bool compactLayout;

  AppearanceSettings copyWith({
    String? themeMode,
    String? primaryColor,
    bool? useMaterial3,
    bool? compactLayout,
  }) {
    return AppearanceSettings(
      themeMode: themeMode ?? this.themeMode,
      primaryColor: primaryColor ?? this.primaryColor,
      useMaterial3: useMaterial3 ?? this.useMaterial3,
      compactLayout: compactLayout ?? this.compactLayout,
    );
  }
}