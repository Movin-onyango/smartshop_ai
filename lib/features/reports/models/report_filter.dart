enum ReportPeriod { today, week, month, quarter, year, custom }

class ReportFilter {
  const ReportFilter({
    this.startDate,
    this.endDate,
    this.period = ReportPeriod.month,
  });

  final DateTime? startDate;
  final DateTime? endDate;
  final ReportPeriod period;
}
