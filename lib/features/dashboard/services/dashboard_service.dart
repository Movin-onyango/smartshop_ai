import '../models/dashboard_summary.dart';

/// Handles communication with the backend.
///
/// For now this service returns mock data.
/// Later it will make HTTP requests to the Node.js API.
class DashboardService {
  const DashboardService();

  Future<DashboardSummary> fetchDashboardSummary() async {
    // Simulate a network request.
    await Future.delayed(const Duration(milliseconds: 800));

    return const DashboardSummary(
      revenue: 125000,
      profit: 42000,
      sales: 184,
      stockValue: 510000,
      healthScore: 92,
      healthStatus: 'Excellent',
      healthSummary:
          'Sales are increasing steadily, stock levels are healthy, and profit margins remain strong.',
    );
  }
}