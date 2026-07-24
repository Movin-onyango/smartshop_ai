/// ---------------------------------------------------------------------------
/// ReportFormatter
/// ---------------------------------------------------------------------------
///
/// Shared formatting helpers used across all report getters.
///
/// Provides formatting for:
/// • Currency
/// • Integers
/// • Decimals
/// • Percentages
/// • Dates
/// • Empty values
/// • Generic text
/// • Boolean values
/// ---------------------------------------------------------------------------
class ReportFormatter {
  ReportFormatter._();

  //--------------------------------------------------------------------------
  // Currency
  //--------------------------------------------------------------------------

  static String currency(
    num value,
  ) {
    return 'KES ${value.toStringAsFixed(2)}';
  }

  //--------------------------------------------------------------------------
  // Integer
  //--------------------------------------------------------------------------

  static String integer(
    num value,
  ) {
    return value.toInt().toString();
  }

  //--------------------------------------------------------------------------
  // Decimal
  //--------------------------------------------------------------------------

  static String decimal(
    num value, {
    int fractionDigits = 2,
  }) {
    return value.toStringAsFixed(
      fractionDigits,
    );
  }

  //--------------------------------------------------------------------------
  // Percentage
  //--------------------------------------------------------------------------

  static String percentage(
    num value,
  ) {
    return '${value.toStringAsFixed(2)}%';
  }

  //--------------------------------------------------------------------------
  // Date
  //--------------------------------------------------------------------------

  static String date(
    DateTime value,
  ) {
    return value.toIso8601String().split('T').first;
  }

  //--------------------------------------------------------------------------
  // Empty String
  //--------------------------------------------------------------------------

  static String empty(
    String? value,
  ) {
    return value == null || value.trim().isEmpty
        ? '-'
        : value;
  }

  //--------------------------------------------------------------------------
  // Generic Text
  //--------------------------------------------------------------------------

  static String text(
    Object? value,
  ) {
    return value?.toString() ?? '-';
  }

  //--------------------------------------------------------------------------
  // Yes / No
  //--------------------------------------------------------------------------

  static String yesNo(
    bool value,
  ) {
    return value ? 'Yes' : 'No';
  }

  //--------------------------------------------------------------------------
  // Active / Inactive
  //--------------------------------------------------------------------------

  static String active(
    bool value,
  ) {
    return value ? 'Active' : 'Inactive';
  }
}