/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../products/providers/product_provider.dart';
import '../../controllers/sale_form_controller.dart';

/// ---------------------------------------------------------------------------
/// ProductPicker
/// ---------------------------------------------------------------------------
///
/// Displays all available products.
///
/// Responsibilities:
/// • Browse products
/// • Add product to cart
/// • Display product price
/// ---------------------------------------------------------------------------
class ProductPicker extends StatelessWidget {
  const ProductPicker({
    super.key,
    required this.controller,
  });

  final SaleFormController controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (provider.products.isEmpty) {
          return const Center(
            child: Text(
              'No products available.',
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: provider.products.length,
          separatorBuilder: (context, index) =>
              const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final product =
                provider.products[index];

            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(
                    product.name.isNotEmpty
                        ? product.name[0].toUpperCase()
                        : '?',
                  ),
                ),

                title: Text(product.name),

                subtitle: Text(
                  'KSh ${product.sellingPrice.toStringAsFixed(2)}',
                ),

                trailing: IconButton(
                  icon: const Icon(Icons.add_circle),
                  color: Theme.of(context)
                      .colorScheme
                      .primary,
                  onPressed: () {
                    controller.addProduct(product);

                    ScaffoldMessenger.of(context)
                        .hideCurrentSnackBar();

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      SnackBar(
                        duration:
                            const Duration(milliseconds: 800),
                        content: Text(
                          '${product.name} added to cart',
                        ),
                      ),
                    );
                  },
                ),

                onTap: () {
                  controller.addProduct(product);

                  ScaffoldMessenger.of(context)
                      .hideCurrentSnackBar();

                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    SnackBar(
                      duration:
                          const Duration(milliseconds: 800),
                      content: Text(
                        '${product.name} added to cart',
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}*/