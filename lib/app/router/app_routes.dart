/// Centralized application route definitions.
///
/// Always reference routes through this class instead of
/// hardcoding route strings.
class AppRoutes {
  AppRoutes._();

  // Splash
  static const String splash = '/';

  // Authentication
  // static const String login = '/login';

  // Dashboard
  static const String dashboard = '/dashboard';

  // Products
  static const String products = '/products';
  static const String addProduct = '/products/add';

  static String productDetails(String id) =>
      '/products/$id';

  static String editProduct(String id) =>
      '/products/$id/edit';

  // Categories
  static const String categories = '/categories';

  static const String addCategory = '/categories/add';

  // Inventory
  static const String inventory = '/inventory';

  static const String inventoryDetails =
      '/inventory/:id';

  static const String adjustStock =
      '/inventory/:id/adjust';

  // Sales
  static const String sales = '/sales';

  static const String addSale =
      '/sales/create';

  static const String checkout =
      '/sales/checkout';

  static const String saleDetails =
      '/sales/:id';

  static const String receipt =
      '/sales/:id/receipt';

  // ---------------------------------------------------------------------------
  // Customers
  // ---------------------------------------------------------------------------

  static const String customers =
      '/customers';

  static const String addCustomer =
      '$customers/add';

  static String customerDetails(
    String id,
  ) =>
      '$customers/$id';

  static String editCustomer(
    String id,
  ) =>
      '$customers/$id/edit';

  // ---------------------------------------------------------------------------
  // Suppliers
  // ---------------------------------------------------------------------------

  static const String suppliers =
      '/suppliers';

  static const String addSupplier =
      '/suppliers/add';

  static String supplierDetails(
    String id,
  ) =>
      '/suppliers/$id';

  static String editSupplier(
    String id,
  ) =>
      '/suppliers/$id/edit';

  // ---------------------------------------------------------------------------
  // Purchases
  // ---------------------------------------------------------------------------

  static const String purchases =
      '/purchases';

  static const String addPurchase =
      '/purchases/add';

  static String purchaseDetails(
    String id,
  ) =>
      '/purchases/$id';

  static String editPurchase(
    String id,
  ) =>
      '/purchases/$id/edit';

  static String receivePurchase(
    String id,
  ) =>
      '/purchases/$id/receive';

  // ---------------------------------------------------------------------------
  // Expenses
  // ---------------------------------------------------------------------------

  static const String expenses =
      '/expenses';

  static const String addExpense =
      '/expenses/add';

  static String expenseDetails(
    String id,
  ) =>
      '/expenses/$id';

  static String editExpense(
    String id,
  ) =>
      '/expenses/$id/edit';

  // Reports
  static const String reports =
      '/reports';

static const salesReport =
    '/reports/sales';

static const  inventoryReport =
    '/reports/inventory';

static const purchaseReport =
    '/reports/purchases';

static const expenseReport =
    '/reports/expenses';

static const customerReport =
    '/reports/customers';

static const supplierReport =
    '/reports/suppliers';

static const financialReport =
    '/reports/financial';

  // Notifications
  static const String notifications =
      '/notifications';

  // Settings
  static const String settings =
      '/settings';

  // AI Assistant
  static const String aiAssistant =
      '/ai-assistant';

  // Profile
  static const String profile =
      '/profile';
}