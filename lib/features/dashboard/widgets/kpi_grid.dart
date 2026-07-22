import 'package:flutter/material.dart';

import 'kpi_card.dart';

class KpiGrid extends StatelessWidget {
  const KpiGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.3,
      children: const [
        KpiCard(
          title: 'Revenue',
          value: 'KES 125K',
          icon: Icons.payments,
          color: Colors.green,
          trend: '+12%',
        ),
        KpiCard(
          title: 'Profit',
          value: 'KES 42K',
          icon: Icons.trending_up,
          color: Colors.blue,
          trend: '+8%',
        ),
        KpiCard(
          title: 'Sales',
          value: '184',
          icon: Icons.shopping_cart,
          color: Colors.orange,
          trend: '+15%',
        ),
        KpiCard(
          title: 'Stock Value',
          value: 'KES 510K',
          icon: Icons.inventory_2,
          color: Colors.purple,
        ),
        KpiCard(
  title: "Today's Sales",
  value: "28",
  icon: Icons.shopping_cart_checkout,
  color: Colors.green,
),

KpiCard(
  title: "Revenue",
  value: "KSh 82,400",
  icon: Icons.payments,
  color: Colors.blue,
),

KpiCard(
  title: "Profit",
  value: "KSh 21,700",
  icon: Icons.trending_up,
  color: Colors.orange,
),
      ],
    );
  }
}