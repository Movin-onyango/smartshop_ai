import 'package:flutter/material.dart';

import '../../controllers/report_controller.dart';
import '../../exporters/report_export_manager.dart';

/// ---------------------------------------------------------------------------
/// ReportExportButton
/// ---------------------------------------------------------------------------
///
/// Generic export button used by every report screen.
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

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${format.name.toUpperCase()} export completed.',
              ),
            ),
          );
        }
      },

      itemBuilder: (_) => const [
        PopupMenuItem(
          value: ExportFormat.pdf,
          child: Text('Export PDF'),
        ),

        PopupMenuItem(
          value: ExportFormat.csv,
          child: Text('Export CSV'),
        ),

        PopupMenuItem(
          value: ExportFormat.excel,
          child: Text('Export Excel'),
        ),
      ],
    );
  }
}