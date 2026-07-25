import '../controllers/report_controller.dart';
import 'csv_report_exporter.dart';
import 'excel_report_exporter.dart';
import 'pdf_report_exporter.dart';

/// ---------------------------------------------------------------------------
/// ExportFormat
/// ---------------------------------------------------------------------------

enum ExportFormat {
  pdf,
  csv,
  excel,
}

/// ---------------------------------------------------------------------------
/// ReportExportManager
/// ---------------------------------------------------------------------------
///
/// Central entry point for exporting reports.
///
/// Every report screen calls only this class.
/// ---------------------------------------------------------------------------
class ReportExportManager {
  const ReportExportManager();

  Future<void> export({
    required ReportController controller,
    required ExportFormat format,
  }) async {
    switch (format) {
      case ExportFormat.pdf:
        await const PdfReportExporter().export(
          controller.exportData,
        );
        break;

      case ExportFormat.csv:
        await const CsvReportExporter().export(
          controller.exportData,
        );
        break;

      case ExportFormat.excel:
        await const ExcelReportExporter().export(
          controller.exportData,
        );
        break;
    }
  }
}