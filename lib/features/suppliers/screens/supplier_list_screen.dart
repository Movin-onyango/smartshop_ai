import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/supplier_provider.dart';
import '../widgets/list/supplier_list_item.dart';

/// ---------------------------------------------------------------------------
/// SupplierListScreen
/// ---------------------------------------------------------------------------
///
/// Displays all suppliers.
///
/// Features:
/// • View suppliers
/// • Search (next iteration)
/// • Filter (next iteration)
/// • Navigate to supplier details
/// ---------------------------------------------------------------------------
class SupplierListScreen extends StatefulWidget {
  const SupplierListScreen({super.key});

  @override
  State<SupplierListScreen> createState() => _SupplierListScreenState();
}

class _SupplierListScreenState extends State<SupplierListScreen> {
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) return;

    context.read<SupplierProvider>().loadSuppliers();

    _initialized = true;
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SupplierProvider>();

    return SmartScaffold(
      title: 'Suppliers',

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push(AppRoutes.addSupplier);
        },
        icon: const Icon(Icons.add),
        label: const Text('Supplier'),
      ),

      body: Builder(
        builder: (_) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.suppliers.isEmpty) {
            return const Center(child: Text('No suppliers available.'));
          }

          return RefreshIndicator(
            onRefresh: provider.refresh,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 80),
              itemCount: provider.suppliers.length,
              itemBuilder: (context, index) {
                final supplier = provider.suppliers[index];

                return SupplierListItem(
                  supplier: supplier,
                  onTap: () {
                    context.push(AppRoutes.supplierDetails(supplier.id!));
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
