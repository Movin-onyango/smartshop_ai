import 'package:flutter/material.dart';
export 'export_report_dialog.dart';
import '../../controllers/report_controller.dart';
import '../../exporters/report_export_manager.dart';

/// ---------------------------------------------------------------------------
/// ExportReportDialog
/// ---------------------------------------------------------------------------
///
/// Displays the available export formats for a report.
/// ---------------------------------------------------------------------------
class ExportReportDialog extends StatelessWidget {
  const ExportReportDialog({
    super.key,
    required this.controller,
  });

  final ReportController controller;

  @override
  Widget build(BuildContext context) {
    final manager = const ReportExportManager();

    return AlertDialog(
      title: const Text(
        'Export Report',
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ExportTile(
            icon: Icons.picture_as_pdf,
            title: 'PDF Document',
            subtitle: 'Professional printable report',
            onTap: () async {
              Navigator.pop(context);

              await manager.export(
                controller: controller,
                format: ExportFormat.pdf,
              );
            },
          ),

          const Divider(),

          _ExportTile(
            icon: Icons.table_chart,
            title: 'Excel Workbook',
            subtitle: 'Spreadsheet (.xlsx)',
            onTap: () async {
              Navigator.pop(context);

              await manager.export(
                controller: controller,
                format: ExportFormat.excel,
              );
            },
          ),

          const Divider(),

          _ExportTile(
            icon: Icons.description,
            title: 'CSV File',
            subtitle: 'Comma-separated values',
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

class _ExportTile extends StatelessWidget {
  const _ExportTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),

      title: Text(title),

      subtitle: Text(subtitle),

      onTap: onTap,
    );
  }
}