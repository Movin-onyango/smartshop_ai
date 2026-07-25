import '../getters/report_getters.dart';
import '../models/report_export_data.dart';
import '../models/report_metadata.dart';
import 'report_controller.dart';

/// ---------------------------------------------------------------------------
/// SupplierReportController
/// ---------------------------------------------------------------------------
///
/// Controller responsible for exposing supplier report data to the UI
/// and report exporters.
/// ---------------------------------------------------------------------------
class SupplierReportController extends ReportController {
  const SupplierReportController(
    super.repository,
  );

  //--------------------------------------------------------------------------
  // Report Data
  //--------------------------------------------------------------------------

  List<List<String>> get tableRows =>
      SupplierReportGetters.tableRows(
        repository.suppliers,
      );

  int get totalSuppliers =>
      SupplierReportGetters.totalSuppliers(
        repository.suppliers,
      );

  //--------------------------------------------------------------------------
  // Export
  //--------------------------------------------------------------------------

  @override
  ReportExportData get exportData {
    return ReportExportData(
      metadata: ReportMetadata(
        title: 'Supplier Report',
        subtitle: 'Supplier directory and procurement partners.',
        generatedAt: DateTime.now(),
        period: 'Current Period',
        businessName: 'SmartShop AI',
      ),
      headers: const [
        'Supplier',
        'Phone',
        'Email',
      ],
      rows: tableRows,
      summary: {
        'Total Suppliers': totalSuppliers.toString(),
      },
    );
  }
}