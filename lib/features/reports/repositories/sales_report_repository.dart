import '../../sales/models/sale.dart';
import '/features/sales/repositories/sales_repository.dart';

class SalesReportRepository {
  const SalesReportRepository();

  List<Sale> get sales => SalesRepository.getAll();
}
