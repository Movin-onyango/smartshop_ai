import '../repositories/report_repository.dart';

/// ---------------------------------------------------------------------------
/// ReportController
/// ---------------------------------------------------------------------------
///
/// Base controller shared by all report controllers.
///
/// Provides access to the report repository used throughout the
/// Reports module.
/// ---------------------------------------------------------------------------
abstract class ReportController {
  const ReportController(this.repository);

  /// Shared report repository.
  final ReportRepository repository;
}