import 'package:flutter/material.dart';

import '../getters/notification_getters.dart';
import '../models/app_notification.dart';
import '../repositories/notification_repository.dart';

/// ---------------------------------------------------------------------------
/// NotificationController
/// ---------------------------------------------------------------------------
///
/// Controller for application notifications.
///
/// Responsibilities:
/// • Expose notification data
/// • Delegate CRUD operations to the repository
/// • Provide helper methods for the UI
/// ---------------------------------------------------------------------------
class NotificationController {
  NotificationController(
    this.repository,
  );

  //----------------------------------------------------------------------------
  // Repository
  //----------------------------------------------------------------------------

  final NotificationRepository repository;

  //----------------------------------------------------------------------------
  // Collections
  //----------------------------------------------------------------------------

  List<AppNotification> get notifications =>
      repository.notifications;

  List<AppNotification> get unreadNotifications =>
      repository.unreadNotifications;

  //----------------------------------------------------------------------------
  // Statistics
  //----------------------------------------------------------------------------

  int get totalNotifications =>
      repository.totalNotifications;

  int get unreadCount =>
      repository.unreadCount;

  bool get hasUnread =>
      repository.hasUnread;

  bool get isEmpty =>
      notifications.isEmpty;

  bool get isNotEmpty =>
      notifications.isNotEmpty;

  //----------------------------------------------------------------------------
  // Lookup
  //----------------------------------------------------------------------------

  AppNotification? findById(
    String id,
  ) {
    return repository.findById(id);
  }

  //----------------------------------------------------------------------------
  // CRUD
  //----------------------------------------------------------------------------

  void addNotification(
    AppNotification notification,
  ) {
    repository.add(notification);
  }

  void removeNotification(
    String id,
  ) {
    repository.remove(id);
  }

  //----------------------------------------------------------------------------
  // Read Status
  //----------------------------------------------------------------------------

  void markAsRead(
    String id,
  ) {
    repository.markAsRead(id);
  }

  void markAllAsRead() {
    repository.markAllAsRead();
  }

  //----------------------------------------------------------------------------
  // Clear
  //----------------------------------------------------------------------------

  void clearNotifications() {
    repository.clear();
  }

  //----------------------------------------------------------------------------
  // UI Helpers
  //----------------------------------------------------------------------------

  String title(
    AppNotification notification,
  ) =>
      NotificationGetters.title(
        notification,
      );

  String message(
    AppNotification notification,
  ) =>
      NotificationGetters.message(
        notification,
      );

  String type(
    AppNotification notification,
  ) =>
      NotificationGetters.typeName(
        notification,
      );

  String date(
    AppNotification notification,
  ) =>
      NotificationGetters.formattedDate(
        notification,
      );

  String time(
    AppNotification notification,
  ) =>
      NotificationGetters.formattedTime(
        notification,
      );

  String dateTime(
    AppNotification notification,
  ) =>
      NotificationGetters.formattedDateTime(
        notification,
      );

  IconData icon(
    AppNotification notification,
  ) =>
      NotificationGetters.icon(
        notification,
      );

  Color iconColor(
    AppNotification notification,
  ) =>
      NotificationGetters.iconColor(
        notification,
      );

  bool isRead(
    AppNotification notification,
  ) =>
      NotificationGetters.isRead(
        notification,
      );

  bool hasRoute(
    AppNotification notification,
  ) =>
      NotificationGetters.hasRoute(
        notification,
      );

  String? route(
    AppNotification notification,
  ) =>
      NotificationGetters.route(
        notification,
      );
}