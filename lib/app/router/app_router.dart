import 'package:go_router/go_router.dart';

import '../../features/products/screens/add_product_screen.dart';
import '../../features/products/screens/edit_product_screen.dart';
import '../../features/products/screens/product_details_screen.dart';
import '../../features/products/screens/product_list_screen.dart';

import '../../features/categories/screens/category_list_screen.dart';
import '../../features/categories/screens/add_category_screen.dart';
import '../../features/categories/screens/category_details_screen.dart';
import '../../features/categories/screens/edit_category_screen.dart';

import '../../features/customers/screens/customer_list_screen.dart';
import '../../features/customers/screens/add_customer_screen.dart';
import '../../features/customers/screens/customer_details_screen.dart';
import '../../features/customers/screens/edit_customer_screen.dart';

import '../../features/suppliers/screens/supplier_list_screen.dart';
import '../../features/suppliers/screens/add_supplier_screen.dart';
import '../../features/suppliers/screens/supplier_details_screen.dart';
import '../../features/suppliers/screens/edit_supplier_screen.dart';

import '../../features/purchases/screens/purchase_list_screen.dart';
import '../../features/purchases/screens/add_purchase_screen.dart';
import '../../features/purchases/screens/edit_purchase_screen.dart';
import '../../features/purchases/screens/purchase_details_screen.dart';
import '../../features/purchases/screens/receive_purchase_screen.dart';

import '../../features/inventory/screens/inventory_list_screen.dart';
import '../../features/inventory/screens/inventory_details_screen.dart';
import '../../features/inventory/screens/stock_adjustment_screen.dart';

import '../../features/sales/screens/sales_list_screen.dart';
import '../../features/sales/screens/create_sale_screen.dart';
import '../../features/sales/screens/checkout_screen.dart';
import '../../features/sales/screens/sale_details_screen.dart';

import '../../features/sales/controllers/sale_form_controller.dart';

import '../../features/dashboard/screens/dashboard_screen.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/expenses/screens/expense_list_screen.dart';
import '../../features/expenses/screens/add_expense_screen.dart';
import '../../features/expenses/screens/expense_details_screen.dart';
import '../../features/expenses/screens/edit_expense_screen.dart';

import '../../features/reports/screens/reports_dashboard_screen.dart';
import '../../features/reports/screens/sales_report_screen.dart';
import '../../features/reports/screens/inventory_report_screen.dart';
import '../../features/reports/screens/purchase_report_screen.dart';
import '../../features/reports/screens/expense_report_screen.dart';
import '../../features/reports/screens/customer_report_screen.dart';
import '../../features/reports/screens/supplier_report_screen.dart';
import '../../features/reports/screens/financial_report_screen.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),

    GoRoute(
      path: AppRoutes.dashboard,
      builder: (context, state) => const DashboardScreen(),
    ),

    GoRoute(
      path: AppRoutes.products,
      builder: (context, state) => const ProductListScreen(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => const AddProductScreen(),
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;

            return ProductDetailsScreen(
              productId: id,
            );
          },
        ),
        GoRoute(
          path: ':id/edit',
          builder: (context, state) {
            final id = state.pathParameters['id']!;

            return EditProductScreen(
              productId: id,
            );
          },
        ),
      ],
    ),

    GoRoute(
      path: AppRoutes.categories,
      builder: (context, state) => const CategoryListScreen(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => const AddCategoryScreen(),
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;

            return CategoryDetailsScreen(
              categoryId: id,
            );
          },
        ),
        GoRoute(
          path: ':id/edit',
          builder: (context, state) {
            final id = state.pathParameters['id']!;

            return EditCategoryScreen(
              categoryId: id,
            );
          },
        ),
      ],
    ),

    GoRoute(
      path: AppRoutes.customers,
      builder: (context, state) => const CustomerListScreen(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => const AddCustomerScreen(),
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;

            return CustomerDetailsScreen(
              customerId: id,
            );
          },
        ),
        GoRoute(
          path: ':id/edit',
          builder: (context, state) {
            final id = state.pathParameters['id']!;

            return EditCustomerScreen(
              customerId: id,
            );
          },
        ),
      ],
    ),

    GoRoute(
      path: AppRoutes.suppliers,
      builder: (context, state) => const SupplierListScreen(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) => const AddSupplierScreen(),
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;

            return SupplierDetailsScreen(
              supplierId: id,
            );
          },
        ),
        GoRoute(
          path: ':id/edit',
          builder: (context, state) {
            final id = state.pathParameters['id']!;

            return EditSupplierScreen(
              supplierId: id,
            );
          },
        ),
      ],
    ),

    GoRoute(
      path: AppRoutes.purchases,
      builder: (context, state) => const PurchaseListScreen(),
    ),

    GoRoute(
      path: AppRoutes.addPurchase,
      builder: (context, state) => const AddPurchaseScreen(),
    ),

    GoRoute(
      path: '/purchases/:id',
      builder: (context, state) => PurchaseDetailsScreen(
        purchaseId: state.pathParameters['id']!,
      ),
    ),

    GoRoute(
      path: '/purchases/:id/edit',
      builder: (context, state) => EditPurchaseScreen(
        purchaseId: state.pathParameters['id']!,
      ),
    ),

    GoRoute(
      path: '/purchases/:id/receive',
      builder: (context, state) => ReceivePurchaseScreen(
        purchaseId: state.pathParameters['id']!,
      ),
    ),

    GoRoute(
      path: AppRoutes.inventory,
      builder: (context, state) => const InventoryListScreen(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;

            return InventoryDetailsScreen(
              inventoryId: id,
            );
          },
        ),
        GoRoute(
          path: ':id/adjust',
          builder: (context, state) {
            final id = state.pathParameters['id']!;

            return StockAdjustmentScreen(
              inventoryId: id,
            );
          },
        ),
      ],
    ),

    GoRoute(
      path: AppRoutes.sales,
      builder: (context, state) => const SalesListScreen(),
      routes: [
        GoRoute(
          path: 'create',
          builder: (context, state) => const CreateSaleScreen(),
        ),
        GoRoute(
          path: 'checkout',
          builder: (context, state) {
            final controller =
                state.extra as SaleFormController;

            return CheckoutScreen(
              saleController: controller,
            );
          },
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;

            return SaleDetailsScreen(
              saleId: id,
            );
          },
        ),
      ],
    ),

    // ---------------------------------------------------------------------------
    // Expenses
    // ---------------------------------------------------------------------------

    GoRoute(
      path: AppRoutes.expenses,
      builder: (context, state) =>
          const ExpenseListScreen(),
    ),

    GoRoute(
      path: AppRoutes.addExpense,
      builder: (context, state) =>
          const AddExpenseScreen(),
    ),

    GoRoute(
      path: '/expenses/:id',
      builder: (context, state) =>
          ExpenseDetailsScreen(
        expenseId: state.pathParameters['id']!,
      ),
    ),

    GoRoute(
      path: '/expenses/:id/edit',
      builder: (context, state) =>
          EditExpenseScreen(
        expenseId: state.pathParameters['id']!,
      ),
    ),

    //---------------------------------------------------------------------------
    // Reports
    //---------------------------------------------------------------------------

    GoRoute(
      path: AppRoutes.reports,
      builder: (_, _) =>
          const ReportsDashboardScreen(),
    ),

    GoRoute(
      path: AppRoutes.salesReport,
      builder: (_,_) =>
          const SalesReportScreen(),
    ),

    GoRoute(
      path: AppRoutes.inventoryReport,
      builder: (_, _) =>
          const InventoryReportScreen(),
    ),

    GoRoute(
      path: AppRoutes.purchaseReport,
      builder: (_, _) =>
          const PurchaseReportScreen(),
    ),

    GoRoute(
      path: AppRoutes.expenseReport,
      builder: (_, _) =>
          const ExpenseReportScreen(),
    ),

    GoRoute(
      path: AppRoutes.customerReport,
      builder: (_, _) =>
          const CustomerReportScreen(),
    ),

    GoRoute(
      path: AppRoutes.supplierReport,
      builder: (_, _) =>
          const SupplierReportScreen(),
    ),

    GoRoute(
      path: AppRoutes.financialReport,
      builder: (_, _) =>
          const FinancialReportScreen(),
    ),
  ],
);