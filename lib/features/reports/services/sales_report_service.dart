/*import '../getters/report_getters.dart';
//import '../repositories/report_repository.dart';
import 'report_service.dart';

class SalesReportService extends ReportService {
  const SalesReportService(super.repository);

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
}*/