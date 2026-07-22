import 'package:flutter/material.dart';

class InventoryStatusCard extends StatelessWidget {
  const InventoryStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            _InventoryRow(
              title: 'Healthy Stock',
              value: '124',
              color: Colors.green,
            ),
            Divider(height: 24),
            _InventoryRow(
              title: 'Low Stock',
              value: '8',
              color: Colors.orange,
            ),
            Divider(height: 24),
            _InventoryRow(
              title: 'Out of Stock',
              value: '3',
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class _InventoryRow extends StatelessWidget {
  const _InventoryRow({
    required this.title,
    required this.value,
    required this.color,
  });

  final String title;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 7,
          backgroundColor: color,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(title),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}