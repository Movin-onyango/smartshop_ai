import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../controllers/checkout_controller.dart';
import '../controllers/sale_form_controller.dart';
import '../models/sale.dart';
import '../providers/sales_provider.dart';
import '../widgets/form/checkout_totals.dart';
import '../widgets/form/payment_selector.dart';

/// ---------------------------------------------------------------------------
/// CheckoutScreen
/// ---------------------------------------------------------------------------
///
/// Finalizes a sale.
///
/// Responsibilities:
/// • Select payment method
/// • Capture payment
/// • Validate checkout
/// • Save sale
/// • Navigate to receipt
/// ---------------------------------------------------------------------------
class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.saleController,
  });

  final SaleFormController saleController;

  @override
  State<CheckoutScreen> createState() =>
      _CheckoutScreenState();
}

class _CheckoutScreenState
    extends State<CheckoutScreen> {
  late final CheckoutController checkoutController;

  @override
  void initState() {
    super.initState();
    checkoutController = CheckoutController();
  }

  @override
  void dispose() {
    checkoutController.dispose();
    super.dispose();
  }

  void _completeSale() {
    final total = widget.saleController.subtotal;

    if (!checkoutController.canCompleteSale(total)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Amount received is less than the total payable.',
          ),
        ),
      );
      return;
    }

    final sale = Sale(
      id: DateTime.now()
          .millisecondsSinceEpoch
          .toString(),
      invoiceNumber:
          'INV-${DateTime.now().millisecondsSinceEpoch}',
      items: List.from(
        widget.saleController.items,
      ),
      payment: checkoutController.buildPayment(),
      saleDate: DateTime.now(),
    );

    context.read<SalesProvider>().addSale(sale);

    widget.saleController.clearCart();

    context.go(
      '${AppRoutes.sales}/${sale.id}/receipt',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Checkout',
      body: AnimatedBuilder(
        animation: checkoutController,
        builder: (context, _) {
          return ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            children: [
              PaymentSelector(
                method: checkoutController.paymentMethod,
                onChanged: (method) {
                  if (method != null) {
                    checkoutController.setPaymentMethod(
                      method,
                    );
                  }
                },
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextFormField(
                  keyboardType:
                      const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Amount Received',
                    prefixIcon: Icon(Icons.payments),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    checkoutController.setAmountReceived(
                      double.tryParse(value) ?? 0,
                    );
                  },
                ),
              ),

              CheckoutTotals(
                saleController: widget.saleController,
                checkoutController: checkoutController,
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: _completeSale,
                    icon: const Icon(
                      Icons.check_circle_outline,
                    ),
                    label: const Text(
                      'Complete Sale',
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}