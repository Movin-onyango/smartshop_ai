class DashboardSummary {
  const DashboardSummary({
    required this.revenue,
    required this.profit,
    required this.sales,
    required this.stockValue,
    required this.healthScore,
    required this.healthStatus,
    required this.healthSummary,
  });

  final double revenue;
  final double profit;
  final int sales;
  final double stockValue;

  final int healthScore;
  final String healthStatus;
  final String healthSummary;
}