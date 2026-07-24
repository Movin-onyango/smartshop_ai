import '../../suppliers/models/supplier.dart';
import '../../suppliers/repositories/supplier_repository.dart';

class SupplierReportRepository {
  const SupplierReportRepository();

  List<Supplier> getAllSuppliers() {
    return SupplierRepository.getAll();
  }
}