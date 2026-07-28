import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// NotificationSummarySection
/// ---------------------------------------------------------------------------
///
/// Displays notification statistics.
///
/// Used by:
/// • NotificationsScreen
/// ---------------------------------------------------------------------------
class NotificationSummarySection extends StatelessWidget {
  const NotificationSummarySection({
    super.key,
    required this.totalNotifications,
    required this.unreadNotifications,
  });

  final int totalNotifications;
  final int unreadNotifications;

  int get readNotifications =>
      totalNotifications - unreadNotifications;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            title: 'Total',
            value: totalNotifications.toString(),
            icon: Icons.notifications,
            color: Colors.blue,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: _SummaryCard(
            title: 'Unread',
            value: unreadNotifications.toString(),
            icon: Icons.mark_email_unread,
            color: Colors.orange,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: _SummaryCard(
            title: 'Read',
            value: readNotifications.toString(),
            icon: Icons.done_all,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}

/// ---------------------------------------------------------------------------
/// _SummaryCard
/// ---------------------------------------------------------------------------
class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor:
                  color.withValues(alpha: 0.12),
              child: Icon(
                icon,
                color: color,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              value,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              title,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}