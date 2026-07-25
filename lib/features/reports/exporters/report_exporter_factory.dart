import 'csv_report_exporter.dart';
import 'excel_report_exporter.dart';
import 'pdf_report_exporter.dart';
import 'report_export_manager.dart';
import 'report_exporter.dart';

/// ---------------------------------------------------------------------------
/// ReportExporterFactory
/// ---------------------------------------------------------------------------
///
/// Creates the correct exporter for the selected format.
///
/// This keeps ReportExportManager small and follows the
/// Open/Closed Principle.
///
/// Adding another export format only requires:
/// • Creating a new exporter
/// • Registering it here
/// ---------------------------------------------------------------------------
class ReportExporterFactory {
  const ReportExporterFactory();

  ReportExporter create(
    ExportFormat format,
  ) {
    switch (format) {
      case ExportFormat.pdf:
        return const PdfReportExporter();

      case ExportFormat.csv:
        return const CsvReportExporter();

      case ExportFormat.excel:
        return const ExcelReportExporter();
    }
  }
}