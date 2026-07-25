import 'package:flutter/material.dart';

class SalesTrendChart extends StatelessWidget {
  const SalesTrendChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: const SizedBox(
        height: 220,
        child: Center(
          child: Text(
            'Sales Trend Chart\n(Coming Soon)',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
