import '../getters/report_getters.dart';
import 'report_controller.dart';

/// ---------------------------------------------------------------------------
/// CustomerReportController
/// ---------------------------------------------------------------------------
class CustomerReportController extends ReportController {
  const CustomerReportController(super.repository);

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
}