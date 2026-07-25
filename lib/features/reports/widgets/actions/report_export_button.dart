import 'package:flutter/material.dart';

import '../../controllers/report_controller.dart';
import '../../exporters/report_export_manager.dart';

/// ---------------------------------------------------------------------------
/// ReportExportButton
/// ---------------------------------------------------------------------------
///
/// Shared export button used by every report screen.
///
/// Allows exporting to:
/// • PDF
/// • CSV
/// • Excel
/// ---------------------------------------------------------------------------
class ReportExportButton extends StatelessWidget {
  const ReportExportButton({
    super.key,
    required this.controller,
  });

  final ReportController controller;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ExportFormat>(
      tooltip: 'Export Report',
      icon: const Icon(Icons.download),
      onSelected: (format) async {
        await const ReportExportManager().export(
          controller: controller,
          format: format,
        );

        if (!context.mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Report exported as ${format.name.toUpperCase()}',
            ),
          ),
        );
      },
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: ExportFormat.pdf,
          child: ListTile(
            leading: Icon(Icons.picture_as_pdf),
            title: Text('Export PDF'),
          ),
        ),
        PopupMenuItem(
          value: ExportFormat.csv,
          child: ListTile(
            leading: Icon(Icons.table_chart),
            title: Text('Export CSV'),
          ),
        ),
        PopupMenuItem(
          value: ExportFormat.excel,
          child: ListTile(
            leading: Icon(Icons.grid_on),
            title: Text('Export Excel'),
          ),
        ),
      ],
    );
  }
}