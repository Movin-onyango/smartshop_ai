/// Centralized application route definitions.
///
/// Always reference routes through this class instead of
/// hardcoding route strings.
class AppRoutes {
  AppRoutes._();

  // Splash
  static const String splash = '/';

  // Authentication
//  static const String login = '/login';

  // Dashboard
  static const String dashboard = '/dashboard';

  // Products
  static const String products = '/products';
  static const String addProduct = '/products/add';

  // Dynamic product routes
  static String productDetails(String id) => '/products/$id';

  static String editProduct(String id) => '/products/$id/edit';

  // Categories
  static const String categories = '/categories';

  static const String addCategory = '/categories/add';

  // Inventory
  static const String inventory = '/inventory';

  static const String inventoryDetails = '/inventory/:id';

  static const String adjustStock = '/inventory/:id/adjust';

  // Sales
  static const String sales = '/sales';

  static const addSale = '/sales/create';

  static const checkout = '/sales/checkout';

  static const saleDetails = '/sales/:id';

  static const receipt = '/sales/:id/receipt';

  // ---------------------------------------------------------------------------
  // Customers
  // ---------------------------------------------------------------------------

  static const String customers = '/customers';

  static const String addCustomer = '$customers/add';

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

  static const String suppliers = '/suppliers';

  static const String addSupplier = '/suppliers/add';

  static String supplierDetails(
    String id,
  ) =>
      '/suppliers/$id';

  static String editSupplier(
    String id,
  ) =>
      '/suppliers/$id/edit';
      // Purchases
static const purchases = '/purchases';
static const addPurchase = '/purchases/add';

static String purchaseDetails(String id) =>
    '/purchases/$id';

static String editPurchase(String id) =>
    '/purchases/$id/edit';

static String receivePurchase(String id) =>
    '/purchases/$id/receive';

  // Reports
  static const String reports = '/reports';

  // Notifications
  static const String notifications = '/notifications';

  // Settings
  static const String settings = '/settings';

  // AI Assistant
  static const String aiAssistant = '/ai-assistant';

  // Profile
  static const String profile = '/profile';
}