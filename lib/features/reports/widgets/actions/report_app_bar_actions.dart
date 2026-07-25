import 'package:flutter/material.dart';

import '../../controllers/report_controller.dart';
import '../dialogs/export_report_dialog.dart';

/// ---------------------------------------------------------------------------
/// ReportAppBarActions
/// ---------------------------------------------------------------------------
///
/// Standard AppBar actions shared by all report screens.
/// ---------------------------------------------------------------------------
class ReportAppBarActions extends StatelessWidget {
  const ReportAppBarActions({
    super.key,
    required this.controller,
  });

  final ReportController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          tooltip: 'Export Report',
          icon: const Icon(
            Icons.download,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => ExportReportDialog(
                controller: controller,
              ),
            );
          },
        ),
      ],
    );
  }
}