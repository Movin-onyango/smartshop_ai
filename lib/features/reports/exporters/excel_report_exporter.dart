import 'dart:io';

import 'package:excel/excel.dart';

import '../models/report_export_data.dart';
import 'report_exporter.dart';
import 'utils/utils.dart';

/// ---------------------------------------------------------------------------
/// ExcelReportExporter
/// ---------------------------------------------------------------------------
///
/// Exports reports as Microsoft Excel workbooks.
/// ---------------------------------------------------------------------------
class ExcelReportExporter
    extends ReportExporter {
  const ExcelReportExporter();

  @override
  Future<void> export(
    ReportExportData data,
  ) async {
    //----------------------------------------------------------------------
    // Workbook
    //----------------------------------------------------------------------

    final excel = Excel.createExcel();

    final sheet = excel['Report'];

    int row = 0;

    //----------------------------------------------------------------------
    // Metadata
    //----------------------------------------------------------------------

    sheet.cell(
      CellIndex.indexByColumnRow(
        columnIndex: 0,
        rowIndex: row++,
      ),
    ).value = TextCellValue(
      data.metadata.title,
    );

    sheet.cell(
      CellIndex.indexByColumnRow(
        columnIndex: 0,
        rowIndex: row++,
      ),
    ).value = TextCellValue(
      data.metadata.subtitle,
    );

    row++;

    sheet.cell(
      CellIndex.indexByColumnRow(
        columnIndex: 0,
        rowIndex: row,
      ),
    ).value = TextCellValue(
      'Business',
    );

    sheet.cell(
      CellIndex.indexByColumnRow(
        columnIndex: 1,
        rowIndex: row++,
      ),
    ).value = TextCellValue(
      data.metadata.businessName,
    );

    sheet.cell(
      CellIndex.indexByColumnRow(
        columnIndex: 0,
        rowIndex: row,
      ),
    ).value = TextCellValue(
      'Generated',
    );

    sheet.cell(
      CellIndex.indexByColumnRow(
        columnIndex: 1,
        rowIndex: row++,
      ),
    ).value = TextCellValue(
      data.metadata.generatedAt.toString(),
    );

    sheet.cell(
      CellIndex.indexByColumnRow(
        columnIndex: 0,
        rowIndex: row,
      ),
    ).value = TextCellValue(
      'Period',
    );

    sheet.cell(
      CellIndex.indexByColumnRow(
        columnIndex: 1,
        rowIndex: row++,
      ),
    ).value = TextCellValue(
      data.metadata.period,
    );

    row++;

    //----------------------------------------------------------------------
    // Headers
    //----------------------------------------------------------------------

    for (int column = 0;
        column < data.headers.length;
        column++) {
      sheet.cell(
        CellIndex.indexByColumnRow(
          columnIndex: column,
          rowIndex: row,
        ),
      ).value = TextCellValue(
        data.headers[column],
      );
    }

    row++;

    //----------------------------------------------------------------------
    // Rows
    //----------------------------------------------------------------------

    for (final reportRow in data.rows) {
      for (int column = 0;
          column < reportRow.length;
          column++) {
        sheet.cell(
          CellIndex.indexByColumnRow(
            columnIndex: column,
            rowIndex: row,
          ),
        ).value = TextCellValue(
          reportRow[column],
        );
      }

      row++;
    }

    row++;

    //----------------------------------------------------------------------
    // Summary
    //----------------------------------------------------------------------

    sheet.cell(
      CellIndex.indexByColumnRow(
        columnIndex: 0,
        rowIndex: row++,
      ),
    ).value = TextCellValue(
      'Summary',
    );

    data.summary.forEach(
      (key, value) {
        sheet.cell(
          CellIndex.indexByColumnRow(
            columnIndex: 0,
            rowIndex: row,
          ),
        ).value = TextCellValue(
          key,
        );

        sheet.cell(
          CellIndex.indexByColumnRow(
            columnIndex: 1,
            rowIndex: row,
          ),
        ).value = TextCellValue(
          value,
        );

        row++;
      },
    );

    //----------------------------------------------------------------------
    // Save
    //----------------------------------------------------------------------

    final bytes = excel.encode();

    if (bytes == null) {
      return;
    }

    final File file =
        await ExportFileHelper.createFile(
      fileName:
          '${data.metadata.title.replaceAll(' ', '_')}.xlsx',
      bytes: bytes,
    );

    await ExportShareHelper.share(
      file,
    );
  }
}