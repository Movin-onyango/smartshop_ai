import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';

import '../models/report_export_data.dart';
import 'report_exporter.dart';
import 'utils/utils.dart';

/// ---------------------------------------------------------------------------
/// CsvReportExporter
/// ---------------------------------------------------------------------------
///
/// Exports a report as a CSV document.
/// ---------------------------------------------------------------------------
class CsvReportExporter
    extends ReportExporter{
  const CsvReportExporter();

  @override
  Future<void> export(
    ReportExportData data,
  ) async {
    final rows = <List<dynamic>>[];

    //----------------------------------------------------------------------
    // Metadata
    //----------------------------------------------------------------------

    rows.add([
      data.metadata.title,
    ]);

    rows.add([
      data.metadata.subtitle,
    ]);

    rows.add([]);

    rows.add([
      'Business',
      data.metadata.businessName,
    ]);

    rows.add([
      'Generated',
      data.metadata.generatedAt.toString(),
    ]);

    rows.add([
      'Period',
      data.metadata.period,
    ]);

    rows.add([]);

    //----------------------------------------------------------------------
    // Table
    //----------------------------------------------------------------------

    rows.add(data.headers);

    rows.addAll(data.rows);

    //----------------------------------------------------------------------
    // Summary
    //----------------------------------------------------------------------

    rows.add([]);

    rows.add([
      'Summary',
    ]);

    data.summary.forEach(
      (key, value) {
        rows.add([
          key,
          value,
        ]);
      },
    );

    //----------------------------------------------------------------------
    // Convert
    //----------------------------------------------------------------------

    final csv = const ListToCsvConverter().convert(
      rows,
    );

    final File file =
        await ExportFileHelper.createFile(
      fileName:
          '${data.metadata.title.replaceAll(' ', '_')}.csv',
      bytes: utf8.encode(csv),
    );

    await ExportShareHelper.share(
      file,
    );
  }
}