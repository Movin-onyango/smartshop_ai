import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/sales_provider.dart';

/// ---------------------------------------------------------------------------
/// SalesSearchBar
/// ---------------------------------------------------------------------------
///
/// Allows searching sales by:
/// • Invoice Number
/// • Customer Name
///
/// The provider currently exposes searchSales().
/// Once backend integration is added, this widget will continue
/// to work without modification.
/// ---------------------------------------------------------------------------
class SalesSearchBar extends StatefulWidget {
  const SalesSearchBar({super.key});

  @override
  State<SalesSearchBar> createState() => _SalesSearchBarState();
}

class _SalesSearchBarState extends State<SalesSearchBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    context.read<SalesProvider>().searchSales(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: _onChanged,
      decoration: InputDecoration(
        hintText: 'Search by invoice or customer...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _controller.text.isEmpty
            ? null
            : IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();

                  context.read<SalesProvider>().loadSales();

                  setState(() {});
                },
              ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
