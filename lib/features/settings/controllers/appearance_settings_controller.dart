import '../getters/appearance_settings_getters.dart';
import 'settings_controller.dart';

/// ---------------------------------------------------------------------------
/// AppearanceSettingsController
/// ---------------------------------------------------------------------------
///
/// Controller for Appearance Settings.
/// ---------------------------------------------------------------------------
class AppearanceSettingsController extends SettingsController {
  const AppearanceSettingsController(
    super.repository,
  );

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  String get themeMode =>
      AppearanceSettingsGetters.themeMode(
        appearance,
      );

  String get primaryColor =>
      AppearanceSettingsGetters.primaryColor(
        appearance,
      );

  bool get useMaterial3 =>
      AppearanceSettingsGetters.useMaterial3(
        appearance,
      );

  bool get compactLayout =>
      AppearanceSettingsGetters.compactLayout(
        appearance,
      );

  bool get isSystemTheme =>
      AppearanceSettingsGetters.isSystemTheme(
        appearance,
      );

  bool get isLightTheme =>
      AppearanceSettingsGetters.isLightTheme(
        appearance,
      );

  bool get isDarkTheme =>
      AppearanceSettingsGetters.isDarkTheme(
        appearance,
      );

  String get themeDescription =>
      AppearanceSettingsGetters.themeDescription(
        appearance,
      );

  String get layoutDescription =>
      AppearanceSettingsGetters.layoutDescription(
        appearance,
      );

  String get materialVersion =>
      AppearanceSettingsGetters.materialVersion(
        appearance,
      );

  bool get usesModernDesign =>
      AppearanceSettingsGetters.usesModernDesign(
        appearance,
      );

  List<String> get enabledFeatures =>
      AppearanceSettingsGetters.enabledFeatures(
        appearance,
      );

  //--------------------------------------------------------------------------
  // Dropdown Data
  //--------------------------------------------------------------------------

  List<String> get availableThemes => const [
        'System',
        'Light',
        'Dark',
      ];

  //--------------------------------------------------------------------------
  // Placeholder Actions
  //--------------------------------------------------------------------------

  /// TODO: Connect to repository update.
  void setThemeMode(String? value) {}

  /// TODO: Connect to repository update.
  void setUseMaterial3(bool value) {}

  /// TODO: Connect to repository update.
  void setCompactLayout(bool value) {}

  /// TODO: Connect to repository update.
  void selectPrimaryColor() {}
}