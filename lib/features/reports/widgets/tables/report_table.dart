import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// ReportTable
/// ---------------------------------------------------------------------------
///
/// Generic reusable report table.
///
/// Used by:
/// • SalesReportScreen
/// • InventoryReportScreen
/// • PurchaseReportScreen
/// • ExpenseReportScreen
/// • CustomerReportScreen
/// • SupplierReportScreen
/// • FinancialReportScreen
/// ---------------------------------------------------------------------------
class ReportTable extends StatelessWidget {
  const ReportTable({
    super.key,
    required this.columns,
    required this.rows,
    this.heading = 'Report Data',
  });

  final String heading;

  final List<String> columns;

  final List<List<String>> rows;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              heading,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowHeight: 48,
                dataRowMinHeight: 52,
                dataRowMaxHeight: 52,
                columns: columns
                    .map(
                      (column) => DataColumn(
                        label: Text(
                          column,
                          style: const TextStyle(
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                rows: rows
                    .map(
                      (row) => DataRow(
                        cells: row
                            .map(
                              (cell) => DataCell(
                                Text(cell),
                              ),
                            )
                            .toList(),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}