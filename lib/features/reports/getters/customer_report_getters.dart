import '../repositories/customer_report_repository.dart';
import 'base/base_report_getters.dart';

class CustomerReportGetters extends BaseReportGetters {
  const CustomerReportGetters();

  static List<List<String>> tableRows(CustomerReportRepository repository) {
    return const CustomerReportRepository()
        .getAllCustomers()
        .map(
          (customer) => [
            customer.id.toString(),
            customer.name,
            customer.phone ?? '',
            customer.email ?? '',
            // currency(customer.creditLimit) ?? '',
            customer.hasLoyalty ? 'Loyalty Member' : 'Regular',
          ],
        )
        .toList();
  }

  static int totalCustomers(CustomerReportRepository repository) {
    return const CustomerReportRepository().getAllCustomers().length;
  }

  static int activeCustomers(CustomerReportRepository repository) {
    return const CustomerReportRepository()
        .getAllCustomers()
        .where((customer) => customer.hasLoyalty)
        .length;
  }
}
