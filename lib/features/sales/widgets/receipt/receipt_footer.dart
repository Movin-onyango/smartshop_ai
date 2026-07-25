import 'package:flutter/material.dart';

class ReceiptFooter extends StatelessWidget {
  const ReceiptFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(height: 32),

        Text('Thank you for shopping with us!', textAlign: TextAlign.center),

        SizedBox(height: 8),

        Text('Powered by SmartShop AI', textAlign: TextAlign.center),
      ],
    );
  }
}
