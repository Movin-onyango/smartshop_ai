import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../models/report_export_data.dart';
import 'report_exporter.dart';
import 'utils/utils.dart';

/// ---------------------------------------------------------------------------
/// PdfReportExporter
/// ---------------------------------------------------------------------------
///
/// Exports reports as PDF documents.
/// ---------------------------------------------------------------------------
class PdfReportExporter
    extends ReportExporter{
  const PdfReportExporter();

  @override
  Future<void> export(
    ReportExportData data,
  ) async {
    //----------------------------------------------------------------------
    // Document
    //----------------------------------------------------------------------

    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),

        build: (context) {
          return [
            //----------------------------------------------------------------
            // Header
            //----------------------------------------------------------------

            pw.Text(
              data.metadata.businessName,
              style: pw.TextStyle(
                fontSize: 22,
                fontWeight: pw.FontWeight.bold,
              ),
            ),

            pw.SizedBox(height: 6),

            pw.Text(
              data.metadata.title,
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
              ),
            ),

            if (data.metadata.subtitle.isNotEmpty)
              pw.Text(
                data.metadata.subtitle,
                style: const pw.TextStyle(
                  fontSize: 12,
                ),
              ),

            pw.SizedBox(height: 12),

            pw.Text(
              'Generated: ${data.metadata.generatedAt}',
            ),

            pw.Text(
              'Period: ${data.metadata.period}',
            ),

            pw.SizedBox(height: 24),

            //----------------------------------------------------------------
            // Table
            //----------------------------------------------------------------

            pw.TableHelper.fromTextArray(
              headers: data.headers,
              data: data.rows,
              border: pw.TableBorder.all(),
              headerStyle: pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              ),
              headerDecoration: const pw.BoxDecoration(
                color: PdfColors.grey300,
              ),
              cellAlignment:
                  pw.Alignment.centerLeft,
            ),

            pw.SizedBox(height: 24),

            //----------------------------------------------------------------
            // Summary
            //----------------------------------------------------------------

            pw.Text(
              'Summary',
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.bold,
              ),
            ),

            pw.SizedBox(height: 8),

            ...data.summary.entries.map(
              (entry) => pw.Padding(
                padding:
                    const pw.EdgeInsets.symmetric(
                  vertical: 3,
                ),
                child: pw.Row(
                  mainAxisAlignment:
                      pw.MainAxisAlignment
                          .spaceBetween,
                  children: [
                    pw.Text(entry.key),
                    pw.Text(entry.value),
                  ],
                ),
              ),
            ),
          ];
        },
      ),
    );

    //----------------------------------------------------------------------
    // Save
    //----------------------------------------------------------------------

    final bytes = await pdf.save();

    final File file =
        await ExportFileHelper.createFile(
      fileName:
          '${data.metadata.title.replaceAll(' ', '_')}.pdf',
      bytes: bytes,
    );

    await ExportShareHelper.share(file);
  }
}