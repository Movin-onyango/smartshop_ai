/// ---------------------------------------------------------------------------
/// BackupSettings
/// ---------------------------------------------------------------------------
///
/// Stores backup and restore preferences used throughout SmartShop AI.
/// ---------------------------------------------------------------------------
class BackupSettings {
  const BackupSettings({
    this.autoBackup = false,
    this.backupFrequency = 'Weekly',
    this.backupLocation = 'Local Storage',
    this.keepBackupHistory = true,
    this.maxBackupCopies = 5,
  });

  /// Enables automatic backups.
  final bool autoBackup;

  /// Frequency used for automatic backups.
  ///
  /// Examples:
  /// - Daily
  /// - Weekly
  /// - Monthly
  final String backupFrequency;

  /// Location where backups are stored.
  final String backupLocation;

  /// Whether previous backup versions should be retained.
  final bool keepBackupHistory;

  /// Maximum number of backup copies to retain.
  final int maxBackupCopies;

  BackupSettings copyWith({
    bool? autoBackup,
    String? backupFrequency,
    String? backupLocation,
    bool? keepBackupHistory,
    int? maxBackupCopies,
  }) {
    return BackupSettings(
      autoBackup: autoBackup ?? this.autoBackup,
      backupFrequency:
          backupFrequency ?? this.backupFrequency,
      backupLocation:
          backupLocation ?? this.backupLocation,
      keepBackupHistory:
          keepBackupHistory ?? this.keepBackupHistory,
      maxBackupCopies:
          maxBackupCopies ?? this.maxBackupCopies,
    );
  }
}