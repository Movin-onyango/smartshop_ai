import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// ---------------------------------------------------------------------------
/// AppDateField
/// ---------------------------------------------------------------------------
///
/// Standard date picker field for SmartShop AI.
///
/// Used by:
/// • Product Expiry Date
/// • Purchase Date
/// • Sale Date
/// • Delivery Date
/// • Customer DOB
/// • Reports Filters
///
/// ---------------------------------------------------------------------------
class AppDateField extends StatefulWidget {
  const AppDateField({
    super.key,
    required this.label,
    required this.controller,

    this.icon,
    this.hint,
    this.validator,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.enabled = true,
    this.dateFormat = 'dd MMM yyyy',
    this.onChanged,
  });

  final String label;

  final TextEditingController controller;

  final IconData? icon;

  final String? hint;

  final String? Function(String?)? validator;

  final DateTime? firstDate;

  final DateTime? lastDate;

  final DateTime? initialDate;

  final bool enabled;

  final String dateFormat;

  final ValueChanged<DateTime>? onChanged;

  @override
  State<AppDateField> createState() => _AppDateFieldState();
}

class _AppDateFieldState extends State<AppDateField> {
  Future<void> _pickDate() async {
    if (!widget.enabled) return;

    final DateTime now = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? now,
      firstDate: widget.firstDate ?? DateTime(2000),
      lastDate: widget.lastDate ?? DateTime(2100),
    );

    if (picked == null) return;

    widget.controller.text =
        DateFormat(widget.dateFormat).format(picked);

    widget.onChanged?.call(picked);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,

      readOnly: true,

      enabled: widget.enabled,

      validator: widget.validator,

      onTap: _pickDate,

      decoration: InputDecoration(
        labelText: widget.label,

        hintText: widget.hint,

        prefixIcon: Icon(
          widget.icon ?? Icons.calendar_month_outlined,
        ),

        suffixIcon: const Icon(
          Icons.arrow_drop_down,
        ),
      ),
    );
  }
}