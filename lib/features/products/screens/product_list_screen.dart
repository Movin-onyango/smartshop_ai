import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '/app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';
import '../providers/product_provider.dart';
import '../widgets/product_filter_bar.dart';
import '../widgets/product_grid.dart';
import '../widgets/product_search_bar.dart';

/// Displays all products in the shop.
///
/// This screen acts as a composition layer and delegates
/// all UI rendering to reusable widgets.
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductProvider>().loadProducts();
    });
  }

  Future<void> _refresh() async {
    await context.read<ProductProvider>().refresh();
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Products',

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push(AppRoutes.addProduct);
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Product'),
      ),

      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            ProductSearchBar(),

            SizedBox(height: 16),

            ProductFilterBar(),

            SizedBox(height: 24),

            ProductGrid(),

            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}