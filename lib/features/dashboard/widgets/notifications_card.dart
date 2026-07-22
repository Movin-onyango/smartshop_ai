import 'package:flutter/material.dart';

class NotificationsCard extends StatelessWidget {
  const NotificationsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: const [
          ListTile(
            leading: Icon(Icons.warning_amber_rounded,
                color: Colors.orange),
            title: Text("Milk stock is running low"),
            subtitle: Text("Only 6 units remaining"),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.error_outline,
                color: Colors.red),
            title: Text("Bread is out of stock"),
            subtitle: Text("Restock immediately"),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.trending_up,
                color: Colors.green),
            title: Text("Weekly profit increased"),
            subtitle: Text("+12% compared to last week"),
          ),
        ],
      ),
    );
  }
}