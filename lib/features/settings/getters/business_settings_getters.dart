import '../models/business_settings.dart';

/// ---------------------------------------------------------------------------
/// BusinessSettingsGetters
/// ---------------------------------------------------------------------------
///
/// Read-only helper methods for BusinessSettings.
/// ---------------------------------------------------------------------------
abstract final class BusinessSettingsGetters {
  const BusinessSettingsGetters._();

  static String businessName(
    BusinessSettings settings,
  ) {
    return settings.businessName;
  }

  static String ownerName(
    BusinessSettings settings,
  ) {
    return settings.ownerName;
  }

  static String phone(
    BusinessSettings settings,
  ) {
    return settings.phone;
  }

  static String email(
    BusinessSettings settings,
  ) {
    return settings.email;
  }

  static String address(
    BusinessSettings settings,
  ) {
    return settings.address;
  }

  static String taxPin(
    BusinessSettings settings,
  ) {
    return settings.taxPin;
  }

  static String logoPath(
    BusinessSettings settings,
  ) {
    return settings.logoPath;
  }

  static bool hasLogo(
    BusinessSettings settings,
  ) {
    return settings.logoPath.trim().isNotEmpty;
  }

  static bool isConfigured(
    BusinessSettings settings,
  ) {
    return settings.businessName.trim().isNotEmpty &&
        settings.ownerName.trim().isNotEmpty &&
        settings.phone.trim().isNotEmpty;
  }

  static String formattedAddress(
    BusinessSettings settings,
  ) {
    return settings.address.trim();
  }

  static String contactInformation(
    BusinessSettings settings,
  ) {
    return [
      settings.phone,
      settings.email,
    ].where((value) => value.trim().isNotEmpty).join(' • ');
  }
}