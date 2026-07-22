import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/sales_provider.dart';

import '../widgets/details/sale_header.dart';
import '../widgets/details/customer_section.dart';
import '../widgets/details/sale_items_section.dart';
import '../widgets/details/payment_section.dart';
import '../widgets/details/sale_summary_section.dart';

/// ---------------------------------------------------------------------------
/// SaleDetailsScreen
/// ---------------------------------------------------------------------------
///
/// Displays a completed sale.
///
/// Responsibilities:
/// • Invoice information
/// • Customer details
/// • Items sold
/// • Payment information
/// • Sale totals
/// • Navigate to receipt
/// ---------------------------------------------------------------------------
class SaleDetailsScreen extends StatelessWidget {
  const SaleDetailsScreen({
    super.key,
    required this.saleId,
  });

  final String saleId;

  @override
  Widget build(BuildContext context) {
    final sale = context.read<SalesProvider>().findById(
          saleId,
        );

    if (sale == null) {
      return const SmartScaffold(
        title: 'Sale',
        body: Center(
          child: Text(
            'Sale not found.',
          ),
        ),
      );
    }

    return SmartScaffold(
      title: 'Sale Details',

      floatingActionButton:
          FloatingActionButton.extended(
        onPressed: () {
          context.push(
            '${AppRoutes.sales}/${sale.id}/receipt',
          );
        },
        icon: const Icon(Icons.receipt_long),
        label: const Text('Receipt'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            SaleHeader(
              sale: sale,
            ),

            const SizedBox(height: 24),

            CustomerSection(
              sale: sale,
            ),

            const SizedBox(height: 24),

            SaleItemsSection(
              sale: sale,
            ),

            const SizedBox(height: 24),

            PaymentSection(
              sale: sale,
            ),

            const SizedBox(height: 24),

            SaleSummarySection(
              sale: sale,
            ),

            const SizedBox(height: 40),

          ],
        ),
      ),
    );
  }
}