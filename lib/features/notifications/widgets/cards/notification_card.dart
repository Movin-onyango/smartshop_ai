import 'package:flutter/material.dart';

import '../tiles/notification_tile.dart';

/// ---------------------------------------------------------------------------
/// NotificationCard
/// ---------------------------------------------------------------------------
///
/// Card representation of a notification.
///
/// Used by:
/// • NotificationListSection
/// • Dashboard notification preview
/// ---------------------------------------------------------------------------
class NotificationCard extends StatelessWidget {
  const NotificationCard({
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
    return Card(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      child: NotificationTile(
        title: title,
        message: message,
        time: time,
        icon: icon,
        iconColor: iconColor,
        isRead: isRead,
        onTap: onTap,
        onDismiss: onDismiss,
      ),
    );
  }
}