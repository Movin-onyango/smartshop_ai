import '../models/report_export_data.dart';
import '../repositories/report_repository.dart';

/// ---------------------------------------------------------------------------
/// ReportController
/// ---------------------------------------------------------------------------
///
/// Base controller shared by all report controllers.
/// ---------------------------------------------------------------------------
abstract class ReportController {
  const ReportController(
    this.repository,
  );

  final ReportRepository repository;

  /// Data used by PDF, Excel and CSV exporters.
  ReportExportData get exportData;
}