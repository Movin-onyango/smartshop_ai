import '../getters/business_settings_getters.dart';
import 'settings_controller.dart';

/// ---------------------------------------------------------------------------
/// BusinessSettingsController
/// ---------------------------------------------------------------------------
///
/// Controller for Business Settings.
/// ---------------------------------------------------------------------------
class BusinessSettingsController extends SettingsController {
  const BusinessSettingsController(
    super.repository,
  );

  //--------------------------------------------------------------------------
  // Getters
  //--------------------------------------------------------------------------

  String get businessName =>
      BusinessSettingsGetters.businessName(
        business,
      );

  String get ownerName =>
      BusinessSettingsGetters.ownerName(
        business,
      );

  String get phone =>
      BusinessSettingsGetters.phone(
        business,
      );

  String get email =>
      BusinessSettingsGetters.email(
        business,
      );

  String get address =>
      BusinessSettingsGetters.address(
        business,
      );

  String get taxPin =>
      BusinessSettingsGetters.taxPin(
        business,
      );

  String get logoPath =>
      BusinessSettingsGetters.logoPath(
        business,
      );

  bool get hasLogo =>
      BusinessSettingsGetters.hasLogo(
        business,
      );

  bool get isConfigured =>
      BusinessSettingsGetters.isConfigured(
        business,
      );

  String get formattedAddress =>
      BusinessSettingsGetters.formattedAddress(
        business,
      );

  String get contactInformation =>
      BusinessSettingsGetters.contactInformation(
        business,
      );

  //--------------------------------------------------------------------------
  // Actions
  //--------------------------------------------------------------------------

  /// Opens the Business Name editor.
  ///
  /// TODO: Replace with dialog/screen implementation.
  void editBusinessName() {}

  /// Opens the Owner Name editor.
  ///
  /// TODO: Replace with dialog/screen implementation.
  void editOwnerName() {}

  /// Opens the Phone editor.
  ///
  /// TODO: Replace with dialog/screen implementation.
  void editPhone() {}

  /// Opens the Email editor.
  ///
  /// TODO: Replace with dialog/screen implementation.
  void editEmail() {}

  /// Opens the Address editor.
  ///
  /// TODO: Replace with dialog/screen implementation.
  void editAddress() {}

  /// Opens the Tax PIN editor.
  ///
  /// TODO: Replace with dialog/screen implementation.
  void editTaxPin() {}

  /// Opens the Business Logo picker.
  ///
  /// TODO: Replace with image picker implementation.
  void editLogo() {}
}