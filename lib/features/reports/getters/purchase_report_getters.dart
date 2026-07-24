import '../repositories/purchase_report_repository.dart';
import 'base/base_report_getters.dart';
import 'base/report_formatter.dart';

class PurchaseReportGetters extends BaseReportGetters {
  const PurchaseReportGetters();

  static List<List<String>> tableRows(
    PurchaseReportRepository repository,
  ) {
    return repository
        .getAllPurchases()
        .map(
          (purchase) => [
            purchase.supplierName,
            ReportFormatter.integer(
              purchase.items.length,
            ),
            ReportFormatter.currency(
              purchase.grandTotal,
            ),
            purchase.status.toString(),
          ],
        )
        .toList();
  }

  static double totalPurchases(
    PurchaseReportRepository repository,
  ) {
    return repository
        .getAllPurchases()
        .fold(
          0.0,
          (sum, purchase) =>
              sum + purchase.grandTotal,
        );
  }
}