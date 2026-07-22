import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '/app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';
import '../providers/product_provider.dart';

import '../widgets/details/product_header.dart';
import '../widgets/details/information_section.dart';
import '../widgets/details/pricing_section.dart';
import '../widgets/details/inventory_section.dart';

/// Displays the complete details of a product.
///
/// The screen is composed of reusable sections to improve
/// maintainability and encourage reuse across the application.
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  /// ID of the product being viewed.
  final String productId;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();
    final product = provider.findById(productId);

    if (product == null) {
      return const Scaffold(
        body: Center(
          child: Text('Product not found'),
        ),
      );
    }

    return SmartScaffold(
      title: 'Product Details',
      actions: [
        IconButton(
          icon: const Icon(Icons.edit_outlined),
          onPressed: () {
            context.push(
              AppRoutes.editProduct(product.id!),
            );
          },
        ),
      ],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductHeader(
              product: product,
            ),

            const SizedBox(height: 24),

            InformationSection(
              product: product,
            ),

            const SizedBox(height: 24),

            PricingSection(
              product: product,
            ),

            const SizedBox(height: 24),

            InventorySection(
              product: product,
            ),

            const SizedBox(height: 32),

            FilledButton.icon(
              onPressed: () {
                context.push(
                  AppRoutes.editProduct(product.id!),
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Product'),
            ),

            const SizedBox(height: 12),

            OutlinedButton.icon(
              onPressed: () {
                // TODO: Display delete confirmation dialog.
              },
              icon: const Icon(Icons.delete_outline),
              label: const Text('Delete Product'),
            ),
          ],
        ),
      ),
    );
  }
}