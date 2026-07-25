import '../../customers/models/customer.dart';
import '../../customers/repositories/customer_repository.dart';

class CustomerReportRepository {
  const CustomerReportRepository();

  List<Customer> getAllCustomers() {
    return CustomerRepository.getAll();
  }
}
