import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../models/purchase.dart';
import '../models/purchase_item.dart';
import '../providers/purchase_provider.dart';

import '../widgets/receive/receive_purchase_items_card.dart';
import '../widgets/receive/receive_purchase_summary_card.dart';
import '../widgets/receive/receive_purchase_actions.dart';

/// ---------------------------------------------------------------------------
/// ReceivePurchaseScreen
/// ---------------------------------------------------------------------------
///
/// Records received quantities for an existing purchase.
///
/// Responsibilities:
/// • Display ordered items
/// • Update received quantities
/// • Submit receipt
/// ---------------------------------------------------------------------------
class ReceivePurchaseScreen extends StatefulWidget {
  const ReceivePurchaseScreen({
    super.key,
    required this.purchaseId,
  });

  final String purchaseId;

  @override
  State<ReceivePurchaseScreen> createState() =>
      _ReceivePurchaseScreenState();
}

class _ReceivePurchaseScreenState
    extends State<ReceivePurchaseScreen> {
  late Purchase purchase;

  late List<PurchaseItem> items;

  bool _initialized = false;

  bool _isSaving = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) return;

    purchase = context
        .read<PurchaseProvider>()
        .findById(widget.purchaseId)!;

    items = purchase.items
        .map((e) => e.copyWith())
        .toList();

    _initialized = true;
  }

  //---------------------------------------------------------------------------
  // Update Quantity
  //---------------------------------------------------------------------------

  void _updateQuantity(
    int index,
    double quantity,
  ) {
    setState(() {
      items[index] = items[index].copyWith(
        receivedQuantity: quantity,
      );
    });
  }

  //---------------------------------------------------------------------------
  // Save
  //---------------------------------------------------------------------------

  Future<void> _receivePurchase() async {
    setState(() {
      _isSaving = true;
    });

    final updatedPurchase =
        purchase.copyWith(
      receivedDate: DateTime.now(),
      items: items,
    );

    await context
        .read<PurchaseProvider>()
        .updatePurchase(updatedPurchase);

    if (!mounted) return;

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Receive Purchase',

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ReceivePurchaseItemsCard(
            items: items,
            onQuantityChanged:
                _updateQuantity,
          ),

          const SizedBox(height: 16),

          ReceivePurchaseSummaryCard(
            purchase: purchase,
            items: items,
          ),

          const SizedBox(height: 24),

          ReceivePurchaseActions(
            isSaving: _isSaving,
            onSave: _receivePurchase,
            onCancel: () {
              Navigator.pop(context);
            },
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}