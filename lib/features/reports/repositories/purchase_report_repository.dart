import '../../purchases/models/purchase.dart';
import '../../purchases/repositories/purchase_repository.dart';

class PurchaseReportRepository {
  const PurchaseReportRepository();

  List<Purchase> getAllPurchases() {
    return PurchaseRepository.getAll();
  }
}

