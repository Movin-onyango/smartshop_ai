import '../models/dashboard_summary.dart';
import '../services/dashboard_service.dart';

/// Repository responsible for obtaining dashboard data.
///
/// The provider talks only to the repository.
/// The repository decides where the data comes from.
class DashboardRepository {
  DashboardRepository({DashboardService? service})
    : _service = service ?? const DashboardService();

  final DashboardService _service;

  Future<DashboardSummary> getDashboardSummary() {
    return _service.fetchDashboardSummary();
  }
}
