import '../models/backup_settings.dart';

/// ---------------------------------------------------------------------------
/// BackupSettingsGetters
/// ---------------------------------------------------------------------------
///
/// Read-only helper methods for BackupSettings.
/// ---------------------------------------------------------------------------
abstract final class BackupSettingsGetters {
  const BackupSettingsGetters._();

  static bool autoBackup(
    BackupSettings settings,
  ) {
    return settings.autoBackup;
  }

  static String backupFrequency(
    BackupSettings settings,
  ) {
    return settings.backupFrequency;
  }

  static String backupLocation(
    BackupSettings settings,
  ) {
    return settings.backupLocation;
  }

  static bool keepBackupHistory(
    BackupSettings settings,
  ) {
    return settings.keepBackupHistory;
  }

  static int maxBackupCopies(
    BackupSettings settings,
  ) {
    return settings.maxBackupCopies;
  }

  static bool automaticBackupEnabled(
    BackupSettings settings,
  ) {
    return settings.autoBackup;
  }

  static bool keepsBackupHistory(
    BackupSettings settings,
  ) {
    return settings.keepBackupHistory;
  }

  static bool isCloudBackup(
    BackupSettings settings,
  ) {
    return settings.backupLocation
            .toLowerCase()
            .contains('cloud');
  }

  static bool isLocalBackup(
    BackupSettings settings,
  ) {
    return settings.backupLocation
            .toLowerCase()
            .contains('local');
  }

  static String backupMode(
    BackupSettings settings,
  ) {
    return settings.autoBackup
        ? 'Automatic Backup'
        : 'Manual Backup';
  }

  static String backupSummary(
    BackupSettings settings,
  ) {
    return '${settings.backupFrequency} • '
        '${settings.backupLocation}';
  }

  static String historySummary(
    BackupSettings settings,
  ) {
    if (!settings.keepBackupHistory) {
      return 'Backup history disabled';
    }

    return 'Keep ${settings.maxBackupCopies} backup copies';
  }

  static List<String> enabledFeatures(
    BackupSettings settings,
  ) {
    final features = <String>[];

    if (settings.autoBackup) {
      features.add('Automatic Backup');
    }

    if (settings.keepBackupHistory) {
      features.add('Backup History');
    }

    features.add(
      'Frequency: ${settings.backupFrequency}',
    );

    features.add(
      'Location: ${settings.backupLocation}',
    );

    features.add(
      'Copies: ${settings.maxBackupCopies}',
    );

    return features;
  }
}