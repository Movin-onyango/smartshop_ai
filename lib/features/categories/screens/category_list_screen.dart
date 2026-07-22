import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/category_provider.dart';
import '../widgets/display/category_grid.dart';
import '../widgets/display/category_search_bar.dart';

/// ---------------------------------------------------------------------------
/// CategoryListScreen
/// ---------------------------------------------------------------------------
///
/// Displays all categories.
///
/// Responsibilities:
/// • Load categories
/// • Search categories
/// • Display category grid
/// • Navigate to Add Category
/// ---------------------------------------------------------------------------
class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() =>
      _CategoryListScreenState();
}

class _CategoryListScreenState
    extends State<CategoryListScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryProvider>().loadCategories();
    });
  }

  Future<void> _refresh() async {
    context.read<CategoryProvider>().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: 'Categories',

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push(AppRoutes.addCategory);
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Category'),
      ),

      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: const [
            CategorySearchBar(),

            SizedBox(height: 24),

            CategoryGrid(),

            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}