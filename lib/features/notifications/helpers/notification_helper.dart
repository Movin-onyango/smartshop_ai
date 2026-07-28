import '../models/app_notification.dart';
import '../models/notification_type.dart';
import '../providers/notification_provider.dart';

/// ---------------------------------------------------------------------------
/// NotificationHelper
/// ---------------------------------------------------------------------------
///
/// Central place for creating application notifications.
///
/// Every feature should use this helper instead of constructing
/// AppNotification directly.
///
/// Used by:
/// • Sales
/// • Inventory
/// • Purchases
/// • Expenses
/// • Customers
/// • Suppliers
/// • Reports
/// • Backup
/// ---------------------------------------------------------------------------
class NotificationHelper {
  const NotificationHelper._();

  //--------------------------------------------------------------------------
  // Generic
  //--------------------------------------------------------------------------

  static void add({
    required NotificationProvider provider,
    required AppNotification notification,
  }) {
    provider.addNotification(
      notification,
    );
  }

  //--------------------------------------------------------------------------
  // Sales
  //--------------------------------------------------------------------------

  static void saleCompleted({
    required NotificationProvider provider,
    required String invoiceNumber,
  }) {
    add(
      provider: provider,
      notification: AppNotification(
        id: DateTime.now()
            .millisecondsSinceEpoch
            .toString(),
        title: 'Sale Completed',
        message:
            'Invoice $invoiceNumber completed successfully.',
        type: NotificationType.sales,
        createdAt: DateTime.now(),
      ),
    );
  }

  //--------------------------------------------------------------------------
  // Inventory
  //--------------------------------------------------------------------------

  static void lowStock({
    required NotificationProvider provider,
    required String productName,
  }) {
    add(
      provider: provider,
      notification: AppNotification(
        id: DateTime.now()
            .millisecondsSinceEpoch
            .toString(),
        title: 'Low Stock',
        message:
            '$productName is below its reorder level.',
        type: NotificationType.inventory,
        createdAt: DateTime.now(),
      ),
    );
  }

  static void outOfStock({
    required NotificationProvider provider,
    required String productName,
  }) {
    add(
      provider: provider,
      notification: AppNotification(
        id: DateTime.now()
            .millisecondsSinceEpoch
            .toString(),
        title: 'Out of Stock',
        message:
            '$productName is out of stock.',
        type: NotificationType.inventory,
        createdAt: DateTime.now(),
      ),
    );
  }

  //--------------------------------------------------------------------------
  // Purchases
  //--------------------------------------------------------------------------

  static void purchaseReceived({
    required NotificationProvider provider,
    required String purchaseNumber,
  }) {
    add(
      provider: provider,
      notification: AppNotification(
        id: DateTime.now()
            .millisecondsSinceEpoch
            .toString(),
        title: 'Purchase Received',
        message:
            'Purchase $purchaseNumber has been received.',
        type: NotificationType.purchase,
        createdAt: DateTime.now(),
      ),
    );
  }

  //--------------------------------------------------------------------------
  // Expenses
  //--------------------------------------------------------------------------

  static void expenseAdded({
    required NotificationProvider provider,
    required String expenseName,
  }) {
    add(
      provider: provider,
      notification: AppNotification(
        id: DateTime.now()
            .millisecondsSinceEpoch
            .toString(),
        title: 'Expense Added',
        message:
            '$expenseName has been recorded.',
        type: NotificationType.expense,
        createdAt: DateTime.now(),
      ),
    );
  }

  //--------------------------------------------------------------------------
  // Reports
  //--------------------------------------------------------------------------

  static void reportGenerated({
    required NotificationProvider provider,
    required String reportName,
  }) {
    add(
      provider: provider,
      notification: AppNotification(
        id: DateTime.now()
            .millisecondsSinceEpoch
            .toString(),
        title: 'Report Generated',
        message:
            '$reportName report generated successfully.',
        type: NotificationType.report,
        createdAt: DateTime.now(),
      ),
    );
  }

  //--------------------------------------------------------------------------
  // Backup
  //--------------------------------------------------------------------------

  static void backupCompleted({
    required NotificationProvider provider,
  }) {
    add(
      provider: provider,
      notification: AppNotification(
        id: DateTime.now()
            .millisecondsSinceEpoch
            .toString(),
        title: 'Backup Completed',
        message:
            'Application backup completed successfully.',
        type: NotificationType.system,
        createdAt: DateTime.now(),
      ),
    );
  }
}