import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '/app/router/app_routes.dart';
import '../providers/product_provider.dart';
import 'empty_products.dart';
import 'product_card.dart';

/// Displays all products in a responsive grid.
///
/// The layout automatically adapts to different screen sizes:
/// • Mobile phones  -> 1 column
/// • Small tablets  -> 2 columns
/// • Large tablets  -> 3 columns
/// • Desktop        -> 4 columns
class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, provider, child) {
        // Show a loading indicator while products are being fetched.
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        // Display the empty state when there are no products.
        if (provider.products.isEmpty) {
          return const EmptyProducts();
        }

        // Build a responsive grid based on the available screen width.
        return LayoutBuilder(
          builder: (context, constraints) {
            // Default to a single-column layout for mobile devices.
            int columns = 1;

            // Desktop layout.
            if (constraints.maxWidth >= 1200) {
              columns = 4;
            }
            // Large tablet layout.
            else if (constraints.maxWidth >= 900) {
              columns = 3;
            }
            // Small tablet layout.
            else if (constraints.maxWidth >= 600) {
              columns = 2;
            }

            return GridView.builder(
              // Allows the grid to size itself inside another scrollable widget.
              shrinkWrap: true,

              // Prevents nested scrolling conflicts.
              physics: const NeverScrollableScrollPhysics(),

              // Total number of products to display.
              itemCount: provider.products.length,

              // Controls the grid layout.
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // Number of columns determined above.
                crossAxisCount: columns,

                // Horizontal spacing between cards.
                crossAxisSpacing: 16,

                // Vertical spacing between cards.
                mainAxisSpacing: 16,

                // Width-to-height ratio of each product card.
                childAspectRatio: 0.85,
              ),

              // Builds each product card lazily for better performance.
              itemBuilder: (context, index) {
                final product = provider.products[index];

                return ProductCard(
                  product: product,

                  // Navigation to the product details page
                  // will be implemented in a later sprint.
                  onTap: () {
                    // TODO: Navigate to Product Details.
                    context.push(AppRoutes.productDetails(product.id!));
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
