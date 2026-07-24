import '../getters/report_getters.dart';
import 'report_controller.dart';

/// ---------------------------------------------------------------------------
/// PurchaseReportController
/// ---------------------------------------------------------------------------
class PurchaseReportController extends ReportController {
  const PurchaseReportController(super.repository);

  List<List<String>> get tableRows =>
      PurchaseReportGetters.tableRows(
        repository.purchases,
      );

  double get totalPurchases =>
      PurchaseReportGetters.totalPurchases(
        repository.purchases,
      );
}