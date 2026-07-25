import 'package:flutter/material.dart';

/// Displays the dashboard greeting and current date.
class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key, this.userName = 'Owner'});

  final String userName;

  String _greeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_greeting()}, $userName 👋',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Here's today's business summary.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        CircleAvatar(radius: 24, child: Icon(Icons.store)),
      ],
    );
  }
}
