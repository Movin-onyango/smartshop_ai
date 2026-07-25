class ReportMetadata {
  const ReportMetadata({
    required this.title,
    required this.subtitle,
    required this.generatedAt,
    required this.period,
    required this.businessName,
  });

  final String title;
  final String subtitle;
  final DateTime generatedAt;
  final String period;
  final String businessName;
}