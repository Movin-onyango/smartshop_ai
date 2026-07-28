import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import '../features/dashboard/providers/dashboard_provider.dart';
import '../features/products/providers/product_provider.dart';
import '../features/categories/providers/category_provider.dart';
import '../features/inventory/providers/inventory_provider.dart';
import '../features/sales/providers/sales_provider.dart';
import '../features/customers/providers/customer_provider.dart';
import '../features/suppliers/providers/supplier_provider.dart';
import '../features/purchases/providers/purchase_provider.dart';
import '../features/expenses/providers/expense_provider.dart';
import '/features/reports/providers/report_provider.dart';
import '/features/settings/providers/settings_provider.dart';
import '/features/notifications/providers/notification_provider.dart';


/// Bootstraps the SmartShop AI application.
///
/// This is the application's composition root.
///
/// As the project grows, this is where we'll initialize:
///
/// • Local database
/// • Shared preferences
/// • Dependency injection
/// • Logging
/// • Crash reporting
/// • AI services
/// • API clients
/// • Authentication
/// • Provider registration
///
/// Keeping these responsibilities out of `main.dart` makes the
/// application easier to maintain and test.

/// Bootstraps the SmartShop AI application.
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Future initialization examples:
  //
  // await LocalDatabase.initialize();
  // await PreferencesService.initialize();
  // await ServiceLocator.initialize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardProvider()),

        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(
          create: (_) => ProductProvider()..loadProducts(),
        ),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => InventoryProvider()),
        ChangeNotifierProvider(create: (_) => SalesProvider()),
        ChangeNotifierProvider(create: (_) => CustomerProvider()),
        ChangeNotifierProvider(create: (_) => SupplierProvider()),
        ChangeNotifierProvider(create: (_) => PurchaseProvider()),
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
        ChangeNotifierProvider(create: (_) => ReportProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider(),
),

      ],
      child: const SmartShopApp(),
    ),
  );
}
