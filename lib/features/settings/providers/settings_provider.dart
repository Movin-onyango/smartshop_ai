import 'package:flutter/material.dart';

import '../controllers/settings_controllers.dart';
import '../models/settings_model.dart';
import '../repositories/settings_repository.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsProvider({
    SettingsRepository? repository,
  }) : repository = repository ?? const SettingsRepository() {
    _business = BusinessSettingsController(this.repository);

    _currency = CurrencySettingsController(this.repository);

    _tax = TaxSettingsController(this.repository);

    _receipt = ReceiptSettingsController(this.repository);

    _inventory = InventorySettingsController(this.repository);

    _sales = SalesSettingsController(this.repository);

    _appearance = AppearanceSettingsController(this.repository);

    _backup = BackupSettingsController(this.repository);

    _security = SecuritySettingsController(this.repository);
  }

  //---------------------------------------------------------------------------
  // Dependencies
  //---------------------------------------------------------------------------

  final SettingsRepository repository;

  //---------------------------------------------------------------------------
  // Controllers
  //---------------------------------------------------------------------------

  late final BusinessSettingsController _business;

  late final CurrencySettingsController _currency;

  late final TaxSettingsController _tax;

  late final ReceiptSettingsController _receipt;

  late final InventorySettingsController _inventory;

  late final SalesSettingsController _sales;

  late final AppearanceSettingsController _appearance;

  late final BackupSettingsController _backup;

  late final SecuritySettingsController _security;

  //---------------------------------------------------------------------------
  // Controller Getters
  //---------------------------------------------------------------------------

  BusinessSettingsController get businessController =>
      _business;

  CurrencySettingsController get currencyController =>
      _currency;

  TaxSettingsController get taxController =>
      _tax;

  ReceiptSettingsController get receiptController =>
      _receipt;

  InventorySettingsController get inventoryController =>
      _inventory;

  SalesSettingsController get salesController =>
      _sales;

  AppearanceSettingsController get appearanceController =>
      _appearance;

  BackupSettingsController get backupController =>
      _backup;

  SecuritySettingsController get securityController =>
      _security;

  //---------------------------------------------------------------------------
  // Root Settings
  //---------------------------------------------------------------------------

  SettingsModel get settings =>
      repository.load();

        //---------------------------------------------------------------------------
  // Operations
  //---------------------------------------------------------------------------

  Future<void> refresh() async {
    notifyListeners();
  }

  Future<void> save(
    SettingsModel settings,
  ) async {
    await repository.save(
      settings,
    );

    notifyListeners();
  }

  Future<void> reset() async {
    await repository.save(
      const SettingsModel(),
    );

    notifyListeners();
  }

  Future<void> importSettings(
    SettingsModel settings,
  ) async {
    await repository.save(
      settings,
    );

    notifyListeners();
  }

  Future<SettingsModel> exportSettings() async {
    return repository.load();
  }
}