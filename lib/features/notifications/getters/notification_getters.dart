import 'package:flutter/material.dart';

import '../models/app_notification.dart';
import '../models/notification_type.dart';

/// ---------------------------------------------------------------------------
/// NotificationGetters
/// ---------------------------------------------------------------------------
///
/// Read-only helper methods for AppNotification.
///
/// Responsibilities:
/// • Encapsulate presentation logic
/// • Keep controllers lightweight
/// ---------------------------------------------------------------------------
class NotificationGetters {
  const NotificationGetters._();

  //----------------------------------------------------------------------------
  // Basic
  //----------------------------------------------------------------------------

  static String id(
    AppNotification notification,
  ) =>
      notification.id;

  static String title(
    AppNotification notification,
  ) =>
      notification.title;

  static String message(
    AppNotification notification,
  ) =>
      notification.message;

  static NotificationType type(
    AppNotification notification,
  ) =>
      notification.type;

  static DateTime createdAt(
    AppNotification notification,
  ) =>
      notification.createdAt;

  static bool isRead(
    AppNotification notification,
  ) =>
      notification.isRead;

  static String? route(
    AppNotification notification,
  ) =>
      notification.route;

  //----------------------------------------------------------------------------
  // Helpers
  //----------------------------------------------------------------------------

  static bool isUnread(
    AppNotification notification,
  ) =>
      !notification.isRead;

  static bool hasRoute(
    AppNotification notification,
  ) =>
      notification.route != null &&
      notification.route!.isNotEmpty;

  static String typeName(
    AppNotification notification,
  ) {
    switch (notification.type) {
      case NotificationType.inventory:
        return 'Inventory';

      case NotificationType.sales:
        return 'Sales';

      case NotificationType.purchase:
        return 'Purchase';

      case NotificationType.customer:
        return 'Customer';

      case NotificationType.supplier:
        return 'Supplier';

      case NotificationType.expense:
        return 'Expense';

      case NotificationType.report:
        return 'Report';

      case NotificationType.backup:
        return 'Backup';

      case NotificationType.security:
        return 'Security';

      case NotificationType.system:
        return 'System';
    }
  }

  //----------------------------------------------------------------------------
  // Date Formatting
  //----------------------------------------------------------------------------

  static String formattedDate(
    AppNotification notification,
  ) {
    final date = notification.createdAt;

    return '${date.day}/${date.month}/${date.year}';
  }

  static String formattedTime(
    AppNotification notification,
  ) {
    final date = notification.createdAt;

    final hour =
        date.hour.toString().padLeft(2, '0');

    final minute =
        date.minute.toString().padLeft(2, '0');

    return '$hour:$minute';
  }

  static String formattedDateTime(
    AppNotification notification,
  ) =>
      '${formattedDate(notification)} ${formattedTime(notification)}';

  //----------------------------------------------------------------------------
  // UI Helpers
  //----------------------------------------------------------------------------

  static IconData icon(
    AppNotification notification,
  ) {
    switch (notification.type) {
      case NotificationType.inventory:
        return Icons.inventory_2;

      case NotificationType.sales:
        return Icons.point_of_sale;

      case NotificationType.purchase:
        return Icons.shopping_bag;

      case NotificationType.customer:
        return Icons.people;

      case NotificationType.supplier:
        return Icons.local_shipping;

      case NotificationType.expense:
        return Icons.receipt_long;

      case NotificationType.report:
        return Icons.analytics;

      case NotificationType.backup:
        return Icons.backup;

      case NotificationType.security:
        return Icons.security;

      case NotificationType.system:
        return Icons.notifications;
    }
  }

  static Color iconColor(
    AppNotification notification,
  ) {
    switch (notification.type) {
      case NotificationType.inventory:
        return Colors.orange;

      case NotificationType.sales:
        return Colors.green;

      case NotificationType.purchase:
        return Colors.blue;

      case NotificationType.customer:
        return Colors.teal;

      case NotificationType.supplier:
        return Colors.deepOrange;

      case NotificationType.expense:
        return Colors.red;

      case NotificationType.report:
        return Colors.purple;

      case NotificationType.backup:
        return Colors.indigo;

      case NotificationType.security:
        return Colors.brown;

      case NotificationType.system:
        return Colors.grey;
    }
  }
}