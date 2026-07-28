import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/notification_provider.dart';

import '../widgets/dialogs/clear_notifications_dialog.dart';
import '../widgets/sections/notification_filter_section.dart';
import '../widgets/sections/notification_list_section.dart';
import '../widgets/sections/notification_summary_section.dart';

/// ---------------------------------------------------------------------------
/// NotificationsScreen
/// ---------------------------------------------------------------------------
///
/// Displays application notifications.
///
/// Used by:
/// • Dashboard
/// • Navigation Drawer
/// ---------------------------------------------------------------------------
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({
    super.key,
  });

  @override
  State<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState
    extends State<NotificationsScreen> {
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<NotificationProvider>();

    var notifications =
        provider.notifications;

    switch (_selectedFilter) {
      case 'Unread':
        notifications =
            provider.unreadNotifications;
        break;

      case 'Read':
        notifications = provider.notifications
            .where(
              (notification) =>
                  provider.controller.isRead(
                notification,
              ),
            )
            .toList();
        break;

      default:
        break;
    }

    return SmartScaffold(
      title: 'Notifications',
      actions: [
        if (provider.notifications.isNotEmpty)
          IconButton(
            tooltip: 'Clear Notifications',
            icon: const Icon(
              Icons.delete_sweep_outlined,
            ),
            onPressed: () {
              ClearNotificationsDialog.show(
                context,
                onConfirm: () {
                  provider.clearNotifications();
                },
              );
            },
          ),
      ],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            NotificationSummarySection(
              totalNotifications:
                  provider.totalNotifications,
              unreadNotifications:
                  provider.unreadCount,
            ),

            const SizedBox(
              height: 24,
            ),

            NotificationFilterSection(
              selectedFilter:
                  _selectedFilter,
              onFilterChanged: (
                filter,
              ) {
                setState(() {
                  _selectedFilter =
                      filter;
                });
              },
            ),

            const SizedBox(
              height: 24,
            ),

            NotificationListSection(
              notifications:
                  notifications,
              controller:
                  provider.controller,

              onTap: (
                notification,
              ) {
                provider.markAsRead(
                  notification.id,
                );
              },

              onDismiss: (
                notification,
              ) {
                provider.removeNotification(
                  notification.id,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}