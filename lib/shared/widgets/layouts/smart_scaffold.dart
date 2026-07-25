import 'package:flutter/material.dart';

/// A reusable scaffold used throughout the SmartShop AI application.
///
/// Features:
/// - Standard AppBar
/// - SafeArea
/// - Consistent page padding
/// - Optional Floating Action Button
/// - Optional Drawer
/// - Pull-to-refresh support
/// - Loading overlay
class SmartScaffold extends StatelessWidget {
  const SmartScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.drawer,
    this.floatingActionButton,
    this.onRefresh,
    this.isLoading = false,
    this.padding = const EdgeInsets.all(20),
    this.backgroundColor,
  });

  /// Page title displayed in the AppBar.
  final String title;

  /// Main page content.
  final Widget body;

  /// Optional AppBar actions.
  final List<Widget>? actions;

  /// Optional navigation drawer.
  final Widget? drawer;

  /// Optional floating action button.
  final Widget? floatingActionButton;

  /// Enables pull-to-refresh when provided.
  final Future<void> Function()? onRefresh;

  /// Shows a loading overlay.
  final bool isLoading;

  /// Default page padding.
  final EdgeInsetsGeometry padding;

  /// Override scaffold background color if needed.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    Widget page = SafeArea(
      child: Padding(padding: padding, child: body),
    );

    if (onRefresh != null) {
      page = RefreshIndicator(
        onRefresh: onRefresh!,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: page,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
      drawer: drawer,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Text(title),
        actions: actions,
      ),
      floatingActionButton: floatingActionButton,
      body: Stack(
        children: [
          page,
          if (isLoading)
            Container(
              color: Colors.black26,
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
