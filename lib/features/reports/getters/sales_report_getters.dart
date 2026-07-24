import '../repositories/sales_report_repository.dart';
import 'base/base_report_getters.dart';
import 'base/report_formatter.dart';

/// ---------------------------------------------------------------------------
/// SalesReportGetters
/// ---------------------------------------------------------------------------
///
/// Transforms sales into report-friendly formats.
/// ---------------------------------------------------------------------------
class SalesReportGetters extends BaseReportGetters {
  const SalesReportGetters();

  static List<List<String>> tableRows(
    SalesReportRepository repository,
  ) {
    return repository.sales
        .map(
          (sale) => [
            sale.invoiceNumber,
           ReportFormatter.integer(sale.items.length),
           ReportFormatter.currency(sale.subtotal),
          ReportFormatter.currency(sale.profit),
          ],
        )
        .toList();
  }

  static double totalSales(
    SalesReportRepository repository,
  ) {
    return repository.sales.fold(
      0,
      (sum, sale) => sum + sale.subtotal,
    );
  }

  static double totalProfit(
    SalesReportRepository repository,
  ) {
    return repository.sales.fold(
      0,
      (sum, sale) => sum + sale.profit,
    );
  }

  static int totalTransactions(
    SalesReportRepository repository,
  ) {
    return repository.sales.length;
  }
}