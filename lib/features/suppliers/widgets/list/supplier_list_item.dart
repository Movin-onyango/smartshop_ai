import 'package:flutter/material.dart';

import '../../models/supplier.dart';
import 'supplier_status_badges.dart';

/// ---------------------------------------------------------------------------
/// SupplierListItem
/// ---------------------------------------------------------------------------
///
/// Reusable supplier tile displayed on the Supplier List screen.
/// ---------------------------------------------------------------------------
class SupplierListItem extends StatelessWidget {
  const SupplierListItem({
    super.key,
    required this.supplier,
    this.onTap,
  });

  final Supplier supplier;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final statistics = supplier.statistics;

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              //----------------------------------------------------------------
              // Header
              //----------------------------------------------------------------

              Row(
                children: [

                  CircleAvatar(
                    radius: 24,
                    child: Text(
                      supplier.name
                          .substring(0, 1)
                          .toUpperCase(),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          supplier.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium,
                        ),

                        if (supplier.contactPerson !=
                            null)
                          Text(
                            supplier.contactPerson!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium,
                          ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.chevron_right,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              //----------------------------------------------------------------
              // Contact
              //----------------------------------------------------------------

              if (supplier.phone != null)
                Row(
                  children: [

                    const Icon(
                      Icons.phone,
                      size: 18,
                    ),

                    const SizedBox(width: 8),

                    Expanded(
                      child: Text(
                        supplier.phone!,
                      ),
                    ),
                  ],
                ),

              if (supplier.email != null)
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [

                      const Icon(
                        Icons.email,
                        size: 18,
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: Text(
                          supplier.email!,
                        ),
                      ),
                    ],
                  ),
                ),

              if (statistics != null)
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [

                      _SummaryItem(
                        label: 'Orders',
                        value: statistics
                            .totalOrders
                            .toString(),
                      ),

                      _SummaryItem(
                        label: 'Purchased',
                        value:
                            statistics.totalPurchased
                                .toStringAsFixed(0),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 16),

              SupplierStatusBadges(
                supplier: supplier,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Summary Item
/// ---------------------------------------------------------------------------
class _SummaryItem extends StatelessWidget {
  const _SummaryItem({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .titleMedium,
        ),

        const SizedBox(height: 4),

        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodySmall,
        ),
      ],
    );
  }
}