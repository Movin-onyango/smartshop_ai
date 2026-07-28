import 'notification_type.dart';

/// ---------------------------------------------------------------------------
/// AppNotification
/// ---------------------------------------------------------------------------
///
/// Represents a SmartShop notification.
///
/// Used by:
/// • NotificationRepository
/// • NotificationProvider
/// • NotificationsScreen
/// ---------------------------------------------------------------------------
class AppNotification {
  const AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.createdAt,
    this.isRead = false,
    this.route,
  });

  final String id;

  final String title;

  final String message;

  final NotificationType type;

  final DateTime createdAt;

  final bool isRead;

  /// Route opened when notification is tapped.
  final String? route;

  //---------------------------------------------------------------------------
  // CopyWith
  //---------------------------------------------------------------------------

  AppNotification copyWith({
    String? id,
    String? title,
    String? message,
    NotificationType? type,
    DateTime? createdAt,
    bool? isRead,
    String? route,
  }) {
    return AppNotification(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
      route: route ?? this.route,
    );
  }
}