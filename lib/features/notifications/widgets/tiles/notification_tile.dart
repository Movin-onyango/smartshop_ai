import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// NotificationTile
/// ---------------------------------------------------------------------------
///
/// Reusable notification tile.
///
/// Used by:
/// • NotificationCard
/// ---------------------------------------------------------------------------
class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    required this.iconColor,
    required this.isRead,
    this.onTap,
    this.onDismiss,
  });

  final String title;
  final String message;
  final String time;

  final IconData icon;
  final Color iconColor;

  final bool isRead;

  final VoidCallback? onTap;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
      key: ValueKey(
        '$title-$time',
      ),
      direction: onDismiss == null
          ? DismissDirection.none
          : DismissDirection.endToStart,
      onDismissed: (_) {
        onDismiss?.call();
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        color: Colors.red,
        child: const Icon(
          Icons.delete_outline,
          color: Colors.white,
        ),
      ),
      child: ListTile(
        onTap: onTap,

        leading: CircleAvatar(
          backgroundColor:
              iconColor.withValues(alpha: 0.12),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),

        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight:
                isRead ? FontWeight.normal : FontWeight.bold,
          ),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(
            top: 4,
          ),
          child: Text(
            message,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        trailing: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.end,
          children: [
            Text(
              time,
              style: theme.textTheme.bodySmall,
            ),

            const SizedBox(
              height: 6,
            ),

            if (!isRead)
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}