import '../getters/security_settings_getters.dart';
import 'settings_controller.dart';

/// ---------------------------------------------------------------------------
/// SecuritySettingsController
/// ---------------------------------------------------------------------------
///
/// Controller for Security Settings.
/// ---------------------------------------------------------------------------
class SecuritySettingsController extends SettingsController {
  const SecuritySettingsController(
    super.repository,
  );

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  bool get pinEnabled =>
      SecuritySettingsGetters.pinEnabled(
        security,
      );

  String get pinCode =>
      SecuritySettingsGetters.pinCode(
        security,
      );

  bool get biometricEnabled =>
      SecuritySettingsGetters.biometricEnabled(
        security,
      );

  int get autoLockMinutes =>
      SecuritySettingsGetters.autoLockMinutes(
        security,
      );

  bool get requireLoginOnLaunch =>
      SecuritySettingsGetters.requireLoginOnLaunch(
        security,
      );

  int get sessionTimeoutMinutes =>
      SecuritySettingsGetters.sessionTimeoutMinutes(
        security,
      );

  bool get allowPasswordReset =>
      SecuritySettingsGetters.allowPasswordReset(
        security,
      );

  bool get enableAuditLog =>
      SecuritySettingsGetters.enableAuditLog(
        security,
      );

  bool get pinProtectionEnabled =>
      SecuritySettingsGetters.pinProtectionEnabled(
        security,
      );

  bool get biometricProtectionEnabled =>
      SecuritySettingsGetters.biometricProtectionEnabled(
        security,
      );

  bool get loginProtectionEnabled =>
      SecuritySettingsGetters.loginProtectionEnabled(
        security,
      );

  bool get auditLoggingEnabled =>
      SecuritySettingsGetters.auditLoggingEnabled(
        security,
      );

  bool get hasScreenLock =>
      SecuritySettingsGetters.hasScreenLock(
        security,
      );

  String get authenticationMethod =>
      SecuritySettingsGetters.authenticationMethod(
        security,
      );

  String get sessionSummary =>
      SecuritySettingsGetters.sessionSummary(
        security,
      );

  String get timeoutSummary =>
      SecuritySettingsGetters.timeoutSummary(
        security,
      );

  List<String> get enabledFeatures =>
      SecuritySettingsGetters.enabledFeatures(
        security,
      );

  //--------------------------------------------------------------------------
  // Dropdown Data
  //--------------------------------------------------------------------------

  List<int> get availableTimeouts => const [
        1,
        2,
        5,
        10,
        15,
        30,
        60,
      ];

  //--------------------------------------------------------------------------
  // Placeholder Actions
  //--------------------------------------------------------------------------

  /// TODO: Connect to repository update.
  void setPinEnabled(bool value) {}

  /// TODO: Connect to repository update.
  void setBiometricEnabled(bool value) {}

  /// TODO: Connect to repository update.
  void setRequireLoginOnLaunch(bool value) {}

  /// TODO: Connect to repository update.
  void setAutoLockMinutes(int? value) {}

  /// TODO: Connect to repository update.
  void setSessionTimeoutMinutes(int? value) {}

  /// TODO: Connect to repository update.
  void setAllowPasswordReset(bool value) {}

  /// TODO: Connect to repository update.
  void setEnableAuditLog(bool value) {}

  /// TODO: Opens the PIN change flow.
  void changePin() {}

  /// TODO: Restores security settings to defaults.
  void resetSecuritySettings() {}
}