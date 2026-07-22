import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';
import '../providers/sales_provider.dart';
import '../widgets/display/sales_grid.dart';
import '../widgets/display/sales_search_bar.dart';

/// ---------------------------------------------------------------------------
/// SalesListScreen
/// ---------------------------------------------------------------------------
///
/// Displays all recorded sales.
///
/// Responsibilities:
/// • Load sales
/// • Search sales
/// • Display sales grid
/// • Navigate to Create Sale
/// ---------------------------------------------------------------------------
class SalesListScreen extends StatefulWidget {
  const SalesListScreen({
    super.key,
  });

  @override
  State<SalesListScreen> createState() =>
      _SalesListScreenState();
}

class _SalesListScreenState
    extends State<SalesListScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SalesProvider>().loadSales();
    });
  }

  Future<void> _refresh() async {
    await context.read<SalesProvider>().refresh();
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Sales',

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push(AppRoutes.addSale);
        },
        icon: const Icon(Icons.add_shopping_cart),
        label: const Text('New Sale'),
      ),

      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          physics:
              const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: const [

            SalesSearchBar(),

            SizedBox(height: 24),

            SalesGrid(),

            SizedBox(height: 24),

          ],
        ),
      ),
    );
  }
}