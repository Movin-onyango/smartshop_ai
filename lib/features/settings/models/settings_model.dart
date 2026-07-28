import 'appearance_settings.dart';
import 'backup_settings.dart';
import 'business_settings.dart';
import 'currency_settings.dart';
import 'inventory_settings.dart';
import 'receipt_settings.dart';
import 'sales_settings.dart';
import 'security_settings.dart';
import 'tax_settings.dart';

/// ---------------------------------------------------------------------------
/// SettingsModel
/// ---------------------------------------------------------------------------
///
/// Root settings model for SmartShop AI.
///
/// This model aggregates every settings category into a single immutable
/// object that can be loaded, saved, copied, exported, and restored.
/// ---------------------------------------------------------------------------
class SettingsModel {
  const SettingsModel({
    this.business = const BusinessSettings(),
    this.currency = const CurrencySettings(),
    this.tax = const TaxSettings(),
    this.receipt = const ReceiptSettings(),
    this.inventory = const InventorySettings(),
    this.sales = const SalesSettings(),
    this.appearance = const AppearanceSettings(),
    this.backup = const BackupSettings(),
    this.security = const SecuritySettings(),
  });

  /// Business information.
  final BusinessSettings business;

  /// Currency preferences.
  final CurrencySettings currency;

  /// Tax configuration.
  final TaxSettings tax;

  /// Receipt preferences.
  final ReceiptSettings receipt;

  /// Inventory preferences.
  final InventorySettings inventory;

  /// Sales preferences.
  final SalesSettings sales;

  /// Appearance preferences.
  final AppearanceSettings appearance;

  /// Backup preferences.
  final BackupSettings backup;

  /// Security preferences.
  final SecuritySettings security;

  SettingsModel copyWith({
    BusinessSettings? business,
    CurrencySettings? currency,
    TaxSettings? tax,
    ReceiptSettings? receipt,
    InventorySettings? inventory,
    SalesSettings? sales,
    AppearanceSettings? appearance,
    BackupSettings? backup,
    SecuritySettings? security,
  }) {
    return SettingsModel(
      business: business ?? this.business,
      currency: currency ?? this.currency,
      tax: tax ?? this.tax,
      receipt: receipt ?? this.receipt,
      inventory: inventory ?? this.inventory,
      sales: sales ?? this.sales,
      appearance: appearance ?? this.appearance,
      backup: backup ?? this.backup,
      security: security ?? this.security,
    );
  }
}