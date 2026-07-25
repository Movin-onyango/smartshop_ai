import 'package:flutter/material.dart';

/// Displays an overall summary of the shop's health.
///
/// Later this widget will consume live analytics and AI insights.
class BusinessHealthCard extends StatelessWidget {
  const BusinessHealthCard({
    super.key,
    required this.score,
    required this.status,
    required this.summary,
  });

  final int score;
  final String status;
  final String summary;

  Color _statusColor() {
    if (score >= 80) return Colors.green;
    if (score >= 60) return Colors.orange;
    return Colors.red;
  }

  IconData _statusIcon() {
    if (score >= 80) return Icons.check_circle;
    if (score >= 60) return Icons.warning;
    return Icons.error;
  }

  @override
  Widget build(BuildContext context) {
    final color = _statusColor();

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Row(
          children: [
            CircleAvatar(
              radius: 34,
              backgroundColor: color.withValues(alpha: 0.12),
              child: Icon(_statusIcon(), color: color, size: 34),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Business Health",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "$score%",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    status,
                    style: TextStyle(color: color, fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 12),

                  Text(summary),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
