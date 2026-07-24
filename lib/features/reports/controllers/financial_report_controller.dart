import '../getters/report_getters.dart';
import 'report_controller.dart';

/// ---------------------------------------------------------------------------
/// FinancialReportController
/// ---------------------------------------------------------------------------
class FinancialReportController extends ReportController {
  const FinancialReportController(super.repository);

  List<List<String>> get tableRows =>
      FinancialReportGetters.tableRows(
        repository.financial,
      );

  double get revenue =>
      FinancialReportGetters.totalRevenue(
        repository.financial,
      );

  double get expenses =>
      FinancialReportGetters.totalExpenses(
        repository.financial,
      );

  double get purchases =>
      FinancialReportGetters.totalPurchases(
        repository.financial,
      );

  double get netProfit =>
      FinancialReportGetters.netProfit(
        repository.financial,
      );
}