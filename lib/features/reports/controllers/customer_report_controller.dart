import '../getters/report_getters.dart';
import '../models/report_export_data.dart';
import '../models/report_metadata.dart';
import 'report_controller.dart';

/// ---------------------------------------------------------------------------
/// CustomerReportController
/// ---------------------------------------------------------------------------
///
/// Controller responsible for exposing customer report data to the UI
/// and report exporters.
/// ---------------------------------------------------------------------------
class CustomerReportController extends ReportController {
  const CustomerReportController(
    super.repository,
  );

  //--------------------------------------------------------------------------
  // Report Data
  //--------------------------------------------------------------------------

  List<List<String>> get tableRows =>
      CustomerReportGetters.tableRows(
        repository.customers,
      );

  int get totalCustomers =>
      CustomerReportGetters.totalCustomers(
        repository.customers,
      );

  int get activeCustomers =>
      CustomerReportGetters.activeCustomers(
        repository.customers,
      );

  //--------------------------------------------------------------------------
  // Export
  //--------------------------------------------------------------------------

  @override
  ReportExportData get exportData {
    return ReportExportData(
      metadata: ReportMetadata(
        title: 'Customer Report',
        subtitle: 'Customer activity and engagement.',
        generatedAt: DateTime.now(),
        period: 'Current Period',
        businessName: 'SmartShop AI',
      ),
      headers: const [
        'Customer',
        'Phone',
        'Email',
      ],
      rows: tableRows,
      summary: {
        'Total Customers': totalCustomers.toString(),
        'Active Customers': activeCustomers.toString(),
      },
    );
  }
}