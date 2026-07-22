import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../app/router/app_routes.dart';
import '../../providers/sales_provider.dart';
import 'empty_sales.dart';
import 'sales_card.dart';

/// ---------------------------------------------------------------------------
/// SalesGrid
/// ---------------------------------------------------------------------------
///
/// Displays all recorded sales in a responsive grid.
///
/// Layout:
/// • Mobile  -> 1 column
/// • Tablet  -> 2 columns
/// • Desktop -> 3–4 columns
/// ---------------------------------------------------------------------------
class SalesGrid extends StatelessWidget {
  const SalesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SalesProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final sales = provider.sales;

        if (sales.isEmpty) {
          return const EmptySales();
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            int columns = 1;

            if (constraints.maxWidth >= 1200) {
              columns = 4;
            } else if (constraints.maxWidth >= 900) {
              columns = 3;
            } else if (constraints.maxWidth >= 600) {
              columns = 2;
            }

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sales.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.05,
              ),
              itemBuilder: (context, index) {
                final sale = sales[index];

                return SalesCard(
                  sale: sale,
                  onTap: () {
                    context.push(
                      '${AppRoutes.sales}/${sale.id}',
                    );
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