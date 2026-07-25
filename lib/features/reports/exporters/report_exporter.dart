import '../models/report_export_data.dart';

/// ---------------------------------------------------------------------------
/// ReportExporter
/// ---------------------------------------------------------------------------
///
/// Base class for all report exporters.
/// ---------------------------------------------------------------------------
abstract class ReportExporter {
  const ReportExporter();

  Future<void> export(
    ReportExportData report,
  );
}