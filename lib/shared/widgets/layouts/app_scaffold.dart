import 'package:flutter/material.dart';

import '../../../core/helpers/responsive_helper.dart';

/// Base scaffold used across SmartShop AI.
///
/// This provides a consistent page layout and responsive padding.
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.floatingActionButton,
    this.drawer,
    this.bottomNavigationBar,
  });

  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title == null
          ? null
          : AppBar(
              title: Text(title!),
              actions: actions,
            ),
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth:
                  ResponsiveHelper.maxContentWidth(context),
            ),
            child: Padding(
              padding:
                  ResponsiveHelper.screenPadding(context),
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}