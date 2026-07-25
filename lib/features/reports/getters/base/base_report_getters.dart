import '/features/reports/getters/base/report_formatter.dart';

/// ---------------------------------------------------------------------------
/// BaseReportGetters
/// ---------------------------------------------------------------------------
///
/// Shared helper methods used by all report getter classes.
///
/// Provides:
/// • Currency formatting
/// • Integer formatting
/// • Decimal formatting
/// • Percentage formatting
/// • Date formatting
/// • Empty value handling
/// • Empty table rows
/// ---------------------------------------------------------------------------
abstract class BaseReportGetters {
  const BaseReportGetters();

  /// Empty table rows.
  static List<List<String>> emptyRows() => [];

  /// Formats a currency value.
  static String currency(num value) {
    return ReportFormatter.currency(value);
  }

  /// Formats an integer value.
  static String integer(num value) {
    return ReportFormatter.integer(value);
  }

  /// Formats a decimal value.
  static String decimal(num value, {int fractionDigits = 2}) {
    return value.toStringAsFixed(fractionDigits);
  }

  /// Formats a percentage value.
  static String percentage(num value) {
    return '${value.toStringAsFixed(2)}%';
  }

  /// Formats a date.
  ///
  /// Uses ISO format by default.
  static String date(DateTime value) {
    return value.toIso8601String().split('T').first;
  }

  /// Returns a placeholder for null or empty strings.
  static String empty(String? value) {
    return ReportFormatter.empty(value);
  }

  /// Converts any value to a non-null String.
  static String text(Object? value) {
    return value?.toString() ?? '-';
  }

  /// Converts a boolean into Yes/No.
  static String yesNo(bool value) {
    return value ? 'Yes' : 'No';
  }

  /// Converts a boolean into Active/Inactive.
  static String active(bool value) {
    return value ? 'Active' : 'Inactive';
  }
}
