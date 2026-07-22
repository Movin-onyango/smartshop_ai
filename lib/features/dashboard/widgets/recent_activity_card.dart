import 'package:flutter/material.dart';

class RecentActivityCard extends StatelessWidget {
  const RecentActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: const [
          _ActivityTile(
            icon: Icons.point_of_sale,
            title: "Sale Recorded",
            subtitle: "Receipt #1023 • KES 1,450",
            color: Colors.green,
          ),
          Divider(height: 1),
          _ActivityTile(
            icon: Icons.inventory_2,
            title: "Stock Updated",
            subtitle: "Sugar increased by 20 units",
            color: Colors.blue,
          ),
          Divider(height: 1),
          _ActivityTile(
            icon: Icons.person_add_alt_1,
            title: "Supplier Added",
            subtitle: "New supplier successfully created",
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class _ActivityTile extends StatelessWidget {
  const _ActivityTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withValues(alpha: 0.12),
        child: Icon(
          icon,
          color: color,
        ),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}