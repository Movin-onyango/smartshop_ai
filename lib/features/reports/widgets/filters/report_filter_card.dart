import 'package:flutter/material.dart';

import '../../models/report_filter.dart';

/// ---------------------------------------------------------------------------
/// ReportFilterCard
/// ---------------------------------------------------------------------------
///
/// Advanced report filtering widget.
///
/// Features:
/// • Report period
/// • Start date
/// • End date
/// • Apply
/// • Reset
/// ---------------------------------------------------------------------------
class ReportFilterCard extends StatefulWidget {
  const ReportFilterCard({
    super.key,
    required this.filter,
    required this.onApply,
    required this.onReset,
  });

  final ReportFilter filter;
  final ValueChanged<ReportFilter> onApply;
  final VoidCallback onReset;

  @override
  State<ReportFilterCard> createState() => _ReportFilterCardState();
}

class _ReportFilterCardState extends State<ReportFilterCard> {
  late ReportPeriod _period;

  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();

    _period = widget.filter.period;
    _startDate = widget.filter.startDate;
    _endDate = widget.filter.endDate;
  }

  Future<void> _pickStartDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  Future<void> _pickEndDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Report Filters',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<ReportPeriod>(
              initialValue: _period,
              decoration: const InputDecoration(labelText: 'Period'),
              items: ReportPeriod.values
                  .map(
                    (period) => DropdownMenuItem(
                      value: period,
                      child: Text(_label(period)),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) return;

                setState(() {
                  _period = value;
                });
              },
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pickStartDate,
                    icon: const Icon(Icons.calendar_today),
                    label: Text(
                      _startDate == null
                          ? 'Start Date'
                          : _formatDate(_startDate!),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pickEndDate,
                    icon: const Icon(Icons.calendar_today),
                    label: Text(
                      _endDate == null ? 'End Date' : _formatDate(_endDate!),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                OutlinedButton.icon(
                  onPressed: widget.onReset,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                ),

                const Spacer(),

                FilledButton.icon(
                  onPressed: () {
                    widget.onApply(
                      ReportFilter(
                        period: _period,
                        startDate: _startDate,
                        endDate: _endDate,
                      ),
                    );
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('Apply'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _label(ReportPeriod period) {
    switch (period) {
      case ReportPeriod.today:
        return 'Today';

      case ReportPeriod.week:
        return 'This Week';

      case ReportPeriod.month:
        return 'This Month';

      case ReportPeriod.quarter:
        return 'This Quarter';

      case ReportPeriod.year:
        return 'This Year';

      case ReportPeriod.custom:
        return 'Custom Range';
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
