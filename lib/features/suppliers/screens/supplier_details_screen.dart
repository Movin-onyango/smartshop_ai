import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../models/supplier.dart';
import '../providers/supplier_provider.dart';

import '../widgets/details/supplier_header.dart';
import '../widgets/details/contact_information.dart';
import '../widgets/details/address_information.dart';
import '../widgets/details/purchase_summary.dart';
import '../widgets/details/balance_summary.dart';
import '../widgets/details/notes_section.dart';
import '../widgets/details/supplier_action_buttons.dart';

/// ---------------------------------------------------------------------------
/// SupplierDetailsScreen
/// ---------------------------------------------------------------------------
///
/// Displays detailed supplier information.
///
/// Used by:
/// • Supplier List
/// ---------------------------------------------------------------------------
class SupplierDetailsScreen extends StatelessWidget {
  const SupplierDetailsScreen({super.key, required this.supplierId});

  final String supplierId;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SupplierProvider>();

    final Supplier? supplier = provider.findById(supplierId);

    if (supplier == null) {
      return const SmartScaffold(
        title: 'Supplier',
        body: Center(child: Text('Supplier not found.')),
      );
    }

    return SmartScaffold(
      title: supplier.name,

      actions: [
        IconButton(
          tooltip: 'Edit',
          icon: const Icon(Icons.edit_outlined),
          onPressed: () {
            context.push(AppRoutes.editSupplier(supplier.id!));
          },
        ),
      ],

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //------------------------------------------------------------------
            // Header
            //------------------------------------------------------------------
            SupplierHeader(supplier: supplier),

            const SizedBox(height: 24),

            //------------------------------------------------------------------
            // Contact
            //------------------------------------------------------------------
            ContactInformation(supplier: supplier),

            const SizedBox(height: 24),

            //------------------------------------------------------------------
            // Address
            //------------------------------------------------------------------
            AddressInformation(supplier: supplier),

            const SizedBox(height: 24),

            //------------------------------------------------------------------
            // Purchases
            //------------------------------------------------------------------
            PurchaseSummary(supplier: supplier),

            const SizedBox(height: 24),

            //------------------------------------------------------------------
            // Financial
            //------------------------------------------------------------------
            BalanceSummary(supplier: supplier),

            const SizedBox(height: 24),

            //------------------------------------------------------------------
            // Notes
            //------------------------------------------------------------------
            NotesSection(supplier: supplier),

            const SizedBox(height: 32),

            //------------------------------------------------------------------
            // Actions
            //------------------------------------------------------------------
            SupplierActionButtons(
              supplier: supplier,
              onDelete: () async {
                await provider.deleteSupplier(supplier.id!);

                if (!context.mounted) return;

                context.pop();
              },
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
