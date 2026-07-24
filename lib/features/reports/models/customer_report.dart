class CustomerReport {
  const CustomerReport({
    required this.totalCustomers,
    required this.activeCustomers,
    required this.newCustomers,
  });

  final int totalCustomers;
  final int activeCustomers;
  final int newCustomers;
}