import '../getters/report_getters.dart';
import 'report_controller.dart';

/// ---------------------------------------------------------------------------
/// SupplierReportController
/// ---------------------------------------------------------------------------
class SupplierReportController extends ReportController {
  const SupplierReportController(super.repository);

  List<List<String>> get tableRows =>
      SupplierReportGetters.tableRows(
        repository.suppliers,
      );

  int get totalSuppliers =>
      SupplierReportGetters.totalSuppliers(
        repository.suppliers,
      );
}