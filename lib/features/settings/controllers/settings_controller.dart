import '../models/settings_model.dart';
import '../repositories/settings_repository.dart';
import '../models/appearance_settings.dart';
import '../models/backup_settings.dart';
import '../models/business_settings.dart';
import '../models/currency_settings.dart';
import '../models/inventory_settings.dart';
import '../models/receipt_settings.dart';
import '../models/sales_settings.dart';
import '../models/security_settings.dart';
import '../models/tax_settings.dart';

/// ---------------------------------------------------------------------------
/// SettingsController
/// ---------------------------------------------------------------------------
///
/// Base controller for all settings.
///
/// Every settings controller extends this class.
///
/// Responsibilities:
/// • Access repository
/// • Expose root settings model
/// • Common helper methods
/// ---------------------------------------------------------------------------
abstract class SettingsController {
  const SettingsController(this.repository);

  /// Repository
  final SettingsRepository repository;

  /// Root settings model.
  SettingsModel get settings => repository.load();

  //----------------------------------------------------------------------------
  // Sections
  //----------------------------------------------------------------------------

  BusinessSettings get business => settings.business;

  CurrencySettings get currency => settings.currency;

  TaxSettings get tax => settings.tax;

  ReceiptSettings get receipt => settings.receipt;

  InventorySettings get inventory => settings.inventory;

  SalesSettings get sales => settings.sales;

  AppearanceSettings get appearance => settings.appearance;

  BackupSettings get backup => settings.backup;

  SecuritySettings get security => settings.security;

  //----------------------------------------------------------------------------
  // Repository Helpers
  //----------------------------------------------------------------------------

  SettingsModel exportSettings() {
    return repository.export();
  }

  Future<void> resetSettings() async {
    await repository.reset();
  }

  Future<void> saveSettings(
    SettingsModel settings,
  ) async {
    await repository.save(settings);
  }

  Future<void> importSettings(
    SettingsModel settings,
  ) async {
    await repository.import(settings);
  }
}