import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/inventory_provider.dart';
import '../widgets/display/inventory_grid.dart';
import '../widgets/display/inventory_search_bar.dart';
import '../widgets/display/inventory_filter_bar.dart';

/// ---------------------------------------------------------------------------
/// InventoryListScreen
/// ---------------------------------------------------------------------------
///
/// Displays all inventory items.
///
/// Responsibilities:
/// • Load inventory
/// • Search inventory
/// • Filter inventory
/// • Navigate to stock adjustment
/// • Display inventory grid
/// ---------------------------------------------------------------------------
class InventoryListScreen extends StatefulWidget {
  const InventoryListScreen({super.key});

  @override
  State<InventoryListScreen> createState() =>
      _InventoryListScreenState();
}

class _InventoryListScreenState
    extends State<InventoryListScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<InventoryProvider>().loadInventory();
    });
  }

  Future<void> _refresh() async {
    await context.read<InventoryProvider>().refresh();
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Inventory',

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push(AppRoutes.inventory);
        },
        icon: const Icon(Icons.edit_note),
        label: const Text('Adjust Stock'),
      ),

      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: const [

            InventorySearchBar(),

            SizedBox(height: 16),

            InventoryFilterBar(),

            SizedBox(height: 24),

            InventoryGrid(),

            SizedBox(height: 24),

          ],
        ),
      ),
    );
  }
}
