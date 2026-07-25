import 'package:flutter/material.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../models/sale.dart';

import '/features/sales/widgets/receipt/receipt_footer.dart';
import '../widgets/receipt/receipt_header.dart';
import '../widgets/receipt/receipt_items.dart';
import '../widgets/receipt/receipt_totals.dart';

/// ---------------------------------------------------------------------------
/// ReceiptScreen
/// ---------------------------------------------------------------------------
///
/// Displays a completed sales receipt.
///
/// Future Features
/// • Print Receipt
/// • Share PDF
/// • Download PDF
/// • Send via WhatsApp
/// • Send via Email
/// ---------------------------------------------------------------------------
class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key, required this.sale, required this.shopName});

  final Sale sale;
  final String shopName;

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Receipt',

      actions: [
        IconButton(
          tooltip: 'Print',
          icon: const Icon(Icons.print),
          onPressed: () {
            // TODO: Print receipt
          },
        ),
        IconButton(
          tooltip: 'Share',
          icon: const Icon(Icons.share),
          onPressed: () {
            // TODO: Share receipt
          },
        ),
      ],

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ReceiptHeader(
                  shopName: shopName,
                  invoiceNumber: sale.invoiceNumber,
                  saleDate: sale.saleDate,
                ),

                ReceiptItems(items: sale.items),

                const SizedBox(height: 24),

                ReceiptTotals(
                  subtotal: sale.grossTotal,
                  discount: sale.totalDiscount,
                  total: sale.subtotal,
                  amountPaid: sale.payment.amountPaid,
                  change: sale.payment.change,
                ),

                const SizedBox(height: 32),

                const ReceiptFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
