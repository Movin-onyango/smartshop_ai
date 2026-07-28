import 'package:flutter/material.dart';

import '../controllers/notification_controller.dart';
import '../models/app_notification.dart';
import '../repositories/notification_repository.dart';

/// ---------------------------------------------------------------------------
/// NotificationProvider
/// ---------------------------------------------------------------------------
///
/// State management for application notifications.
///
/// Used by:
/// • NotificationsScreen
/// • Dashboard notification badge
/// • Notification drawer
/// ---------------------------------------------------------------------------
class NotificationProvider extends ChangeNotifier {
  NotificationProvider({
    NotificationRepository? repository,
  }) : repository =
            repository ?? NotificationRepository() {
    _controller = NotificationController(
      this.repository,
    );
  }

  //---------------------------------------------------------------------------
  // Dependencies
  //---------------------------------------------------------------------------

  final NotificationRepository repository;

  late final NotificationController _controller;

  //---------------------------------------------------------------------------
  // Controller
  //---------------------------------------------------------------------------

  NotificationController get controller =>
      _controller;

  //---------------------------------------------------------------------------
  // Notification Collections
  //---------------------------------------------------------------------------

  List<AppNotification> get notifications =>
      controller.notifications;

  List<AppNotification> get unreadNotifications =>
      controller.unreadNotifications;

  //---------------------------------------------------------------------------
  // Statistics
  //---------------------------------------------------------------------------

  int get unreadCount =>
      controller.unreadCount;

  int get totalNotifications =>
      controller.totalNotifications;

  bool get hasUnread =>
      controller.hasUnread;

  bool get isEmpty =>
      controller.isEmpty;

  bool get isNotEmpty =>
      controller.isNotEmpty;

  //---------------------------------------------------------------------------
  // Lookup
  //---------------------------------------------------------------------------

  AppNotification? findById(
    String id,
  ) {
    return controller.findById(id);
  }

  //---------------------------------------------------------------------------
  // Operations
  //---------------------------------------------------------------------------

  Future<void> addNotification(
    AppNotification notification,
  ) async {
    controller.addNotification(
      notification,
    );

    notifyListeners();
  }

  Future<void> removeNotification(
    String id,
  ) async {
    controller.removeNotification(
      id,
    );

    notifyListeners();
  }

  Future<void> markAsRead(
    String id,
  ) async {
    controller.markAsRead(
      id,
    );

    notifyListeners();
  }

  Future<void> markAllAsRead() async {
    controller.markAllAsRead();

    notifyListeners();
  }

  Future<void> clearNotifications() async {
    controller.clearNotifications();

    notifyListeners();
  }

  Future<void> refresh() async {
    notifyListeners();
  }
}