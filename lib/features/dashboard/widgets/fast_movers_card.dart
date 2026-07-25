import 'package:flutter/material.dart';

class FastMoversCard extends StatelessWidget {
  const FastMoversCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            _FastMover(product: "Milk", progress: .95),
            SizedBox(height: 20),
            _FastMover(product: "Bread", progress: .82),
            SizedBox(height: 20),
            _FastMover(product: "Sugar", progress: .71),
          ],
        ),
      ),
    );
  }
}

class _FastMover extends StatelessWidget {
  const _FastMover({required this.product, required this.progress});

  final String product;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          minHeight: 8,
          borderRadius: BorderRadius.circular(12),
        ),
      ],
    );
  }
}
