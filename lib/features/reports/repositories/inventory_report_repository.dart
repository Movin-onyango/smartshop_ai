import '../../products/models/product.dart';
import '../../products/repositories/product_repository.dart';

class InventoryReportRepository {
  const InventoryReportRepository();

  List<Product> getAllProducts() {
    return ProductRepository.getAll();
  }
}