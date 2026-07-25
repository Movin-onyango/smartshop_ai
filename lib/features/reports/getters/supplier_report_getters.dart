import '../repositories/supplier_report_repository.dart';
import 'base/base_report_getters.dart';

class SupplierReportGetters extends BaseReportGetters {
  const SupplierReportGetters();

  static List<List<String>> tableRows(SupplierReportRepository repository) {
    return const SupplierReportRepository()
        .getAllSuppliers()
        .map(
          (supplier) => [
            supplier.name,
            supplier.phone ?? '',
            supplier.email ?? '',
          ],
        )
        .toList();
  }

  static int totalSuppliers(SupplierReportRepository repository) {
    return const SupplierReportRepository().getAllSuppliers().length;
  }
}
