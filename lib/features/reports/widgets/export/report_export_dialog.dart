import 'package:flutter/material.dart';

import '../../controllers/report_controller.dart';
import '../../exporters/report_export_manager.dart';

/// ---------------------------------------------------------------------------
/// ReportExportDialog
/// ---------------------------------------------------------------------------
///
/// Allows the user to choose an export format.
///
/// Shared by every report screen.
/// ---------------------------------------------------------------------------
class ReportExportDialog extends StatelessWidget {
  const ReportExportDialog({
    super.key,
    required this.controller,
  });

  final ReportController controller;

  @override
  Widget build(BuildContext context) {
    const manager = ReportExportManager();

    return AlertDialog(
      title: const Text(
        'Export Report',
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(
              Icons.picture_as_pdf,
            ),
            title: const Text(
              'Export as PDF',
            ),
            onTap: () async {
              Navigator.pop(context);

              await manager.export(
                controller: controller,
                format: ExportFormat.pdf,
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.table_chart,
            ),
            title: const Text(
              'Export as Excel',
            ),
            onTap: () async {
              Navigator.pop(context);

              await manager.export(
                controller: controller,
                format: ExportFormat.excel,
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.description,
            ),
            title: const Text(
              'Export as CSV',
            ),
            onTap: () async {
              Navigator.pop(context);

              await manager.export(
                controller: controller,
                format: ExportFormat.csv,
              );
            },
          ),
        ],
      ),
    );
  }
}