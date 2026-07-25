import 'report_metadata.dart';
class ReportExportData {
  const ReportExportData({
    required this.metadata,
    required this.headers,
    required this.rows,
    required this.summary,
  });

  final ReportMetadata metadata;

  final List<String> headers;

  final List<List<String>> rows;

  final Map<String, String> summary;
}