/*import '../getters/report_getters.dart';
import 'report_service.dart';

class FinancialReportService extends ReportService {
  const FinancialReportService(super.repository);

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
}*/