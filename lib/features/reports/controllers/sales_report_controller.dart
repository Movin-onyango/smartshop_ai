import '../getters/report_getters.dart';
import 'report_controller.dart';

/// ---------------------------------------------------------------------------
/// SalesReportController
/// ---------------------------------------------------------------------------
class SalesReportController extends ReportController {
  const SalesReportController(super.repository);

  List<List<String>> get tableRows =>
      SalesReportGetters.tableRows(
        repository.sales,
      );

  double get totalSales =>
      SalesReportGetters.totalSales(
        repository.sales,
      );

  double get totalProfit =>
      SalesReportGetters.totalProfit(
        repository.sales,
      );
}