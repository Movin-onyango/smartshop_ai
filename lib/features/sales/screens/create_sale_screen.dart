import 'package:flutter/material.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../../products/repositories/product_repository.dart';

import '../controllers/sale_form_controller.dart';

import '../widgets/form/product_search_bar.dart';
import '../widgets/form/product_grid.dart';
import '../widgets/form/sale_cart.dart';
import '../widgets/form/customer_selector.dart';
import '../widgets/form/payment_selector.dart';
import '../widgets/form/sale_totals_card.dart';

/// ---------------------------------------------------------------------------
/// CreateSaleScreen
/// ---------------------------------------------------------------------------
///
/// Point-of-sale screen.
///
/// Workflow:
/// Search Product
/// → Add Product
/// → Cart
/// → Customer
/// → Payment
/// → Totals
/// → Checkout
/// ---------------------------------------------------------------------------
class CreateSaleScreen extends StatefulWidget {
  const CreateSaleScreen({super.key});

  @override
  State<CreateSaleScreen> createState() => _CreateSaleScreenState();
}

class _CreateSaleScreenState extends State<CreateSaleScreen> {
  late final SaleFormController controller;

  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller = SaleFormController();

    controller.loadProducts(ProductRepository.getAll());
  }

  @override
  void dispose() {
    _searchController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'New Sale',
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Search
                ProductSearchBar(
                  controller: _searchController,
                  onChanged: controller.searchProducts,
                ),

                const SizedBox(height: 24),

                /// Products
                ProductGrid(
                  products: controller.filteredProducts,
                  onProductSelected: controller.addProduct,
                ),

                const SizedBox(height: 24),

                /// Cart
                SaleCart(
                  items: controller.cartItems,
                  onIncrease: controller.increaseQuantity,
                  onDecrease: controller.decreaseQuantity,
                  onRemove: controller.removeItem,
                ),

                const SizedBox(height: 24),

                /// Customer
                CustomerSelector(
                  customerName: controller.customerName,
                  customerPhone: controller.customerPhone,
                  onTap: controller.selectCustomer,
                  onClear: controller.clearCustomer,
                ),

                const SizedBox(height: 24),

                /// Payment
                PaymentSelector(
                  method: controller.paymentMethod,
                  onChanged: (method) {
                    if (method != null) {
                      controller.setPaymentMethod(method);
                    }
                  },
                ),

                const SizedBox(height: 24),

                /// Totals
                SaleTotalsCard(
                  grossTotal: controller.grossTotal,
                  discount: controller.discount,
                  subtotal: controller.subtotal,
                  profit: controller.expectedProfit,
                ),

                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: controller.cartItems.isEmpty
                        ? null
                        : controller.checkout,
                    icon: const Icon(Icons.shopping_cart_checkout),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text('Proceed to Checkout'),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}
