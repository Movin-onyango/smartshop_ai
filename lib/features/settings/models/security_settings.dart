/// ---------------------------------------------------------------------------
/// SecuritySettings
/// ---------------------------------------------------------------------------
///
/// Stores application security preferences used throughout SmartShop AI.
/// ---------------------------------------------------------------------------
class SecuritySettings {
  const SecuritySettings({
    this.pinEnabled = false,
    this.pinCode = '',
    this.biometricEnabled = false,
    this.autoLockMinutes = 10,
    this.requireLoginOnLaunch = true,
    this.sessionTimeoutMinutes = 30,
    this.allowPasswordReset = true,
    this.enableAuditLog = true,
  });

  /// Enables PIN authentication.
  final bool pinEnabled;

  /// Application PIN.
  final String pinCode;

  /// Enables biometric authentication.
  final bool biometricEnabled;

  /// Automatically locks the application after inactivity.
  final int autoLockMinutes;

  /// Requires user authentication whenever the app starts.
  final bool requireLoginOnLaunch;

  /// Automatically expires the user session after inactivity.
  final int sessionTimeoutMinutes;

  /// Allows users to reset their password.
  final bool allowPasswordReset;

  /// Records important security events.
  final bool enableAuditLog;

  SecuritySettings copyWith({
    bool? pinEnabled,
    String? pinCode,
    bool? biometricEnabled,
    int? autoLockMinutes,
    bool? requireLoginOnLaunch,
    int? sessionTimeoutMinutes,
    bool? allowPasswordReset,
    bool? enableAuditLog,
  }) {
    return SecuritySettings(
      pinEnabled: pinEnabled ?? this.pinEnabled,
      pinCode: pinCode ?? this.pinCode,
      biometricEnabled:
          biometricEnabled ?? this.biometricEnabled,
      autoLockMinutes:
          autoLockMinutes ?? this.autoLockMinutes,
      requireLoginOnLaunch:
          requireLoginOnLaunch ??
              this.requireLoginOnLaunch,
      sessionTimeoutMinutes:
          sessionTimeoutMinutes ??
              this.sessionTimeoutMinutes,
      allowPasswordReset:
          allowPasswordReset ??
              this.allowPasswordReset,
      enableAuditLog:
          enableAuditLog ?? this.enableAuditLog,
    );
  }
}