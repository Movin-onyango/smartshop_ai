import '../models/appearance_settings.dart';

/// ---------------------------------------------------------------------------
/// AppearanceSettingsGetters
/// ---------------------------------------------------------------------------
///
/// Read-only helper methods for AppearanceSettings.
/// ---------------------------------------------------------------------------
abstract final class AppearanceSettingsGetters {
  const AppearanceSettingsGetters._();

  static String themeMode(
    AppearanceSettings settings,
  ) {
    return settings.themeMode;
  }

  static String primaryColor(
    AppearanceSettings settings,
  ) {
    return settings.primaryColor;
  }

  static bool useMaterial3(
    AppearanceSettings settings,
  ) {
    return settings.useMaterial3;
  }

  static bool compactLayout(
    AppearanceSettings settings,
  ) {
    return settings.compactLayout;
  }

  static bool isSystemTheme(
    AppearanceSettings settings,
  ) {
    return settings.themeMode == 'system';
  }

  static bool isLightTheme(
    AppearanceSettings settings,
  ) {
    return settings.themeMode == 'light';
  }

  static bool isDarkTheme(
    AppearanceSettings settings,
  ) {
    return settings.themeMode == 'dark';
  }

  static String themeDescription(
    AppearanceSettings settings,
  ) {
    switch (settings.themeMode) {
      case 'light':
        return 'Light Theme';

      case 'dark':
        return 'Dark Theme';

      default:
        return 'System Default';
    }
  }

  static String layoutDescription(
    AppearanceSettings settings,
  ) {
    return settings.compactLayout
        ? 'Compact Layout'
        : 'Comfortable Layout';
  }

  static String materialVersion(
    AppearanceSettings settings,
  ) {
    return settings.useMaterial3
        ? 'Material 3'
        : 'Material 2';
  }

  static List<String> enabledFeatures(
    AppearanceSettings settings,
  ) {
    final features = <String>[];

    features.add(themeDescription(settings));

    features.add(materialVersion(settings));

    features.add(layoutDescription(settings));

    features.add(
      'Primary Color: ${settings.primaryColor}',
    );

    return features;
  }

  static bool usesModernDesign(
    AppearanceSettings settings,
  ) {
    return settings.useMaterial3;
  }
}