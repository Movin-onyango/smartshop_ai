import 'package:flutter/material.dart';

import '../models/product.dart';
import 'expiry_badge.dart';
import 'stock_badge.dart';

/// Displays a single product in the product list.
///
/// The card presents the product's key information in a clean,
/// easy-to-scan layout with responsive spacing and clearly
/// separated sections.
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Calculate the profit earned from selling one unit.
    final profit = product.sellingPrice - product.buyingPrice;

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          // Slightly increased padding for improved readability.
          padding: const EdgeInsets.all(24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product avatar displaying the first letter
              // of the product name.
              CircleAvatar(
                radius: 28,
                child: Text(
                  product.name.substring(0, 1).toUpperCase(),
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product name.
                    Text(
                      product.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),

                    const SizedBox(height: 4),

                    // Product category.
                    Text(
                      product.category,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                    const SizedBox(height: 12),

                    // Product status badges.
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        StockBadge(
                          quantity: product.quantity,
                        ),
                        ExpiryBadge(
                          expiryDate: product.expiryDate,
                        ),
                      ],
                    ),

                    // Divider separating badges from metrics.
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Divider(height: 1),
                    ),

                    // Product metrics displayed vertically for
                    // improved readability.
                    Column(
                      children: [
                        _MetricRow(
                          label: 'Selling Price',
                          value:
                              'KES ${product.sellingPrice.toStringAsFixed(0)}',
                        ),

                        const SizedBox(height: 8),

                        _MetricRow(
                          label: 'Profit / Unit',
                          value: 'KES ${profit.toStringAsFixed(0)}',
                        ),

                        const SizedBox(height: 8),

                        _MetricRow(
                          label: 'Quantity',
                          value: '${product.quantity}',
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // Indicates the card is tappable.
              const Icon(
                Icons.chevron_right_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Displays a single product metric as a label-value pair.
///
/// This layout is easier to scan than placing multiple metrics
/// side-by-side, especially on smaller screens.
class _MetricRow extends StatelessWidget {
  const _MetricRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}