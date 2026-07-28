import '../getters/backup_settings_getters.dart';
import 'settings_controller.dart';

/// ---------------------------------------------------------------------------
/// BackupSettingsController
/// ---------------------------------------------------------------------------
///
/// Controller for Backup Settings.
/// ---------------------------------------------------------------------------
class BackupSettingsController extends SettingsController {
  const BackupSettingsController(
    super.repository,
  );

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  bool get autoBackup =>
      BackupSettingsGetters.autoBackup(
        backup,
      );

  String get backupFrequency =>
      BackupSettingsGetters.backupFrequency(
        backup,
      );

  String get backupLocation =>
      BackupSettingsGetters.backupLocation(
        backup,
      );

  bool get keepBackupHistory =>
      BackupSettingsGetters.keepBackupHistory(
        backup,
      );

  int get maxBackupCopies =>
      BackupSettingsGetters.maxBackupCopies(
        backup,
      );

  bool get automaticBackupEnabled =>
      BackupSettingsGetters.automaticBackupEnabled(
        backup,
      );

  bool get keepsBackupHistory =>
      BackupSettingsGetters.keepsBackupHistory(
        backup,
      );

  bool get isCloudBackup =>
      BackupSettingsGetters.isCloudBackup(
        backup,
      );

  bool get isLocalBackup =>
      BackupSettingsGetters.isLocalBackup(
        backup,
      );

  String get backupMode =>
      BackupSettingsGetters.backupMode(
        backup,
      );

  String get backupSummary =>
      BackupSettingsGetters.backupSummary(
        backup,
      );

  String get historySummary =>
      BackupSettingsGetters.historySummary(
        backup,
      );

  List<String> get enabledFeatures =>
      BackupSettingsGetters.enabledFeatures(
        backup,
      );

  //--------------------------------------------------------------------------
  // Dropdown Data
  //--------------------------------------------------------------------------

  List<String> get availableFrequencies => const [
        'Daily',
        'Weekly',
        'Monthly',
      ];

  //--------------------------------------------------------------------------
  // Placeholder Values
  //--------------------------------------------------------------------------

  /// TODO: Read from repository.
  String get lastBackup => 'Never';

  //--------------------------------------------------------------------------
  // Placeholder Actions
  //--------------------------------------------------------------------------

  /// TODO: Connect to repository update.
  void setAutoBackupEnabled(bool value) {}

  /// TODO: Connect to repository update.
  void setBackupFrequency(String? value) {}

  /// TODO: Open folder picker.
  void changeBackupLocation() {}

  /// TODO: Execute backup.
  void backupNow() {}

  /// TODO: Restore backup.
  void restoreBackup() {}
}