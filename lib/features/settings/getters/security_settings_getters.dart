import '../models/security_settings.dart';

/// ---------------------------------------------------------------------------
/// SecuritySettingsGetters
/// ---------------------------------------------------------------------------
///
/// Read-only helper methods for SecuritySettings.
/// ---------------------------------------------------------------------------
abstract final class SecuritySettingsGetters {
  const SecuritySettingsGetters._();

  static bool pinEnabled(
    SecuritySettings settings,
  ) {
    return settings.pinEnabled;
  }

  static String pinCode(
    SecuritySettings settings,
  ) {
    return settings.pinCode;
  }

  static bool biometricEnabled(
    SecuritySettings settings,
  ) {
    return settings.biometricEnabled;
  }

  static int autoLockMinutes(
    SecuritySettings settings,
  ) {
    return settings.autoLockMinutes;
  }

  static bool requireLoginOnLaunch(
    SecuritySettings settings,
  ) {
    return settings.requireLoginOnLaunch;
  }

  static int sessionTimeoutMinutes(
    SecuritySettings settings,
  ) {
    return settings.sessionTimeoutMinutes;
  }

  static bool allowPasswordReset(
    SecuritySettings settings,
  ) {
    return settings.allowPasswordReset;
  }

  static bool enableAuditLog(
    SecuritySettings settings,
  ) {
    return settings.enableAuditLog;
  }

  static bool pinProtectionEnabled(
    SecuritySettings settings,
  ) {
    return settings.pinEnabled &&
        settings.pinCode.trim().isNotEmpty;
  }

  static bool biometricProtectionEnabled(
    SecuritySettings settings,
  ) {
    return settings.biometricEnabled;
  }

  static bool loginProtectionEnabled(
    SecuritySettings settings,
  ) {
    return settings.requireLoginOnLaunch;
  }

  static bool auditLoggingEnabled(
    SecuritySettings settings,
  ) {
    return settings.enableAuditLog;
  }

  static bool hasScreenLock(
    SecuritySettings settings,
  ) {
    return pinProtectionEnabled(settings) ||
        biometricProtectionEnabled(settings);
  }

  static String authenticationMethod(
    SecuritySettings settings,
  ) {
    if (pinProtectionEnabled(settings) &&
        biometricProtectionEnabled(settings)) {
      return 'PIN + Biometrics';
    }

    if (biometricProtectionEnabled(settings)) {
      return 'Biometrics';
    }

    if (pinProtectionEnabled(settings)) {
      return 'PIN';
    }

    return 'None';
  }

  static String sessionSummary(
    SecuritySettings settings,
  ) {
    return 'Auto-lock after '
        '${settings.autoLockMinutes} minutes';
  }

  static String timeoutSummary(
    SecuritySettings settings,
  ) {
    return 'Session timeout: '
        '${settings.sessionTimeoutMinutes} minutes';
  }

  static List<String> enabledFeatures(
    SecuritySettings settings,
  ) {
    final features = <String>[];

    if (pinProtectionEnabled(settings)) {
      features.add('PIN Protection');
    }

    if (biometricProtectionEnabled(settings)) {
      features.add('Biometric Login');
    }

    if (settings.requireLoginOnLaunch) {
      features.add('Login on Launch');
    }

    if (settings.allowPasswordReset) {
      features.add('Password Reset');
    }

    if (settings.enableAuditLog) {
      features.add('Audit Log');
    }

    features.add(
      'Auto-lock: ${settings.autoLockMinutes} min',
    );

    features.add(
      'Session Timeout: ${settings.sessionTimeoutMinutes} min',
    );

    return features;
  }
}