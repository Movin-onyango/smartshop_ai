import 'package:flutter/material.dart';

import '../../models/sale.dart';

/// ---------------------------------------------------------------------------
/// SalesCard
/// ---------------------------------------------------------------------------
///
/// Displays a summary of a completed sale.
///
/// Responsibilities:
/// • Invoice number
/// • Sale date
/// • Customer
/// • Payment method
/// • Revenue
/// • Profit
/// ---------------------------------------------------------------------------
class SalesCard extends StatelessWidget {
  const SalesCard({
    super.key,
    required this.sale,
    required this.onTap,
  });

  final Sale sale;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              Row(
                children: [

                  CircleAvatar(
                    backgroundColor:
                        colorScheme.primaryContainer,
                    child: Icon(
                      Icons.receipt_long,
                      color: colorScheme.primary,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          sale.invoiceNumber,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium,
                          maxLines: 1,
                          overflow:
                              TextOverflow.ellipsis,
                        ),

                        Text(
                          sale.hasCustomer
                              ? sale.customerName!
                              : 'Walk-in Customer',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall,
                        ),

                      ],
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 20),

              _infoRow(
                'Items',
                '${sale.totalQuantity}',
              ),

              _infoRow(
                'Payment',
                sale.payment.method.name.toUpperCase(),
              ),

              _infoRow(
                'Revenue',
                'KSh ${sale.subtotal.toStringAsFixed(2)}',
              ),

              _infoRow(
                'Profit',
                'KSh ${sale.profit.toStringAsFixed(2)}',
              ),

              const Spacer(),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  _formatDate(sale.saleDate),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(title),
          ),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  static String _formatDate(
    DateTime date,
  ) {
    return '${date.day}/${date.month}/${date.year}';
  }
}