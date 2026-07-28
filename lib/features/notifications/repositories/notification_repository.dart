import '../models/app_notification.dart';

/// NotificationRepository

/// Repository responsible for managing application notifications.
///
/// Responsibilities:
/// • Store notifications
/// • Add notifications
/// • Remove notifications
/// • Mark notifications as read
/// • Clear notifications
/// ---------------------------------------------------------------------------
class NotificationRepository {
  NotificationRepository({
    List<AppNotification>? notifications,
  }) : _notifications = notifications ?? [];

  // Storage
  
  final List<AppNotification> _notifications;

  // Getters

  List<AppNotification> get notifications =>
      List.unmodifiable(_notifications);

  List<AppNotification> get unreadNotifications =>
      _notifications
          .where(
            (notification) => !notification.isRead,
          )
          .toList(growable: false);

  int get unreadCount =>
      unreadNotifications.length;

  int get totalNotifications =>
      _notifications.length;

  bool get hasUnread =>
      unreadCount > 0;

  // CRUD

  void add(
    AppNotification notification,
  ) {
    _notifications.insert(
      0,
      notification,
    );
  }

  void remove(
    String id,
  ) {
    _notifications.removeWhere(
      (notification) => notification.id == id,
    );
  }

  AppNotification? findById(
    String id,
  ) {
    try {
      return _notifications.firstWhere(
        (notification) => notification.id == id,
      );
    } catch (_) {
      return null;
    }
  }

  // Read Status

  void markAsRead(
    String id,
  ) {
    final index = _notifications.indexWhere(
      (notification) => notification.id == id,
    );

    if (index == -1) return;

    _notifications[index] =
        _notifications[index].copyWith(
      isRead: true,
    );
  }

  void markAllAsRead() {
    for (var i = 0; i < _notifications.length; i++) {
      _notifications[i] =
          _notifications[i].copyWith(
        isRead: true,
      );
    }
  }

  //---------------------------------------------------------------------------
  // Clear
  //---------------------------------------------------------------------------

  void clear() {
    _notifications.clear();
  }
}