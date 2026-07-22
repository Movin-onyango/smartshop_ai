import 'package:flutter/material.dart';

class ResponsiveDashboard extends StatelessWidget {
  const ResponsiveDashboard({
    super.key,
    required this.mobile,
    required this.tablet,
    this.desktop,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1200 && desktop != null) {
      return desktop!;
    }

    if (width >= 700) {
      return tablet;
    }

    return mobile;
  }
}