import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../models/purchase.dart';
import '../providers/purchase_provider.dart';

import '../widgets/details/purchase_actions.dart';
import '../widgets/details/purchase_header.dart';
import '../widgets/details/purchase_information_section.dart';
import '../widgets/details/purchase_items_section.dart';
import '../widgets/details/purchase_notes_section.dart';
import '../widgets/details/purchase_summary_section.dart';

/// ---------------------------------------------------------------------------
/// PurchaseDetailsScreen
/// ---------------------------------------------------------------------------
///
/// Displays complete purchase information.
///
/// Responsibilities:
/// • Load purchase
/// • Navigation
/// • Delete purchase
/// ---------------------------------------------------------------------------
class PurchaseDetailsScreen extends StatelessWidget {
  const PurchaseDetailsScreen({super.key, required this.purchaseId});

  final String purchaseId;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PurchaseProvider>();

    final Purchase? purchase = provider.findById(purchaseId);

    if (purchase == null) {
      return const Scaffold(body: Center(child: Text('Purchase not found.')));
    }

    return SmartScaffold(
      title: 'Purchase Details',

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          //--------------------------------------------------------------------
          // Header
          //--------------------------------------------------------------------
          PurchaseHeader(purchase: purchase),

          const SizedBox(height: 16),

          //--------------------------------------------------------------------
          // Information
          //--------------------------------------------------------------------
          PurchaseInformationSection(purchase: purchase),

          const SizedBox(height: 16),

          //--------------------------------------------------------------------
          // Items
          //--------------------------------------------------------------------
          PurchaseItemsSection(purchase: purchase),

          const SizedBox(height: 16),

          //--------------------------------------------------------------------
          // Summary
          //--------------------------------------------------------------------
          PurchaseSummarySection(purchase: purchase),

          const SizedBox(height: 16),

          //--------------------------------------------------------------------
          // Notes
          //--------------------------------------------------------------------
          PurchaseNotesSection(purchase: purchase),

          const SizedBox(height: 16),

          //--------------------------------------------------------------------
          // Actions
          //--------------------------------------------------------------------
          PurchaseActions(
            canEdit: true,

            canDelete: true,

            canReceive: !purchase.isFullyReceived,

            onEdit: () {
              // TODO:
              // Navigate to EditPurchaseScreen
            },

            onReceive: () {
              // TODO:
              // Navigate to ReceivePurchaseScreen
            },

            onDelete: () async {
              await provider.deletePurchase(purchase.id!);

              if (!context.mounted) return;

              Navigator.pop(context);
            },
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
