import 'package:flutter/material.dart';

import '../../controllers/notification_controller.dart';
import '../../models/app_notification.dart';

import '../cards/notification_card.dart';

//
// NotificationListSection
// Displays the notification list.
// Used by:
//NotificationsScreen
class NotificationListSection extends StatelessWidget {
  const NotificationListSection({
    super.key,
    required this.notifications,
    required this.controller,
    this.onTap,
    this.onDismiss,
  });

  final List<AppNotification> notifications;

  final NotificationController controller;

  final void Function(
    AppNotification notification,
  )? onTap;

  final void Function(
    AppNotification notification,
  )? onDismiss;

  @override
  Widget build(BuildContext context) {
    if (notifications.isEmpty) {
      return const _EmptyNotificationsView();
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: notifications.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final notification =
            notifications[index];

        return NotificationCard(
          title: controller.title(
            notification,
          ),
          message: controller.message(
            notification,
          ),
          time: controller.time(
            notification,
          ),
          icon: controller.icon(
            notification,
          ),
          iconColor: controller.iconColor(
            notification,
          ),
          isRead: controller.isRead(
            notification,
          ),
          onTap: onTap == null
              ? null
              : () => onTap!(
                    notification,
                  ),
          onDismiss: onDismiss == null
              ? null
              : () => onDismiss!(
                    notification,
                  ),
        );
      },
    );
  }
}
/// _EmptyNotificationsView
/// Displayed when there are no notifications.
class _EmptyNotificationsView
    extends StatelessWidget {
  const _EmptyNotificationsView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 48,
      ),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.notifications_off_outlined,
              size: 72,
              color: theme.colorScheme.outline,
            ),

            const SizedBox(height: 16),

            Text(
              'No Notifications',
              style: theme.textTheme.titleLarge,
            ),

            const SizedBox(height: 8),

            Text(
              'You have no notifications at the moment.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}