import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../providers/customer_provider.dart';

import '../widgets/list/customer_search_bar.dart';
import '../widgets/list/customer_list_item.dart';

/// ---------------------------------------------------------------------------
/// CustomerListScreen
/// ---------------------------------------------------------------------------
///
/// Displays all customers.
///
/// Responsibilities:
/// • Search customers
/// • Browse customers
/// • Open customer details
/// • Add customer
/// ---------------------------------------------------------------------------
class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({
    super.key,
  });

  @override
  State<CustomerListScreen> createState() =>
      _CustomerListScreenState();
}

class _CustomerListScreenState
    extends State<CustomerListScreen> {
  final _searchController =
      TextEditingController();

  String _query = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      context
          .read<CustomerProvider>()
          .loadCustomers();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerProvider>(
      builder: (context, provider, _) {
        final customers =
            provider.search(_query);

        return SmartScaffold(
          title: 'Customers',

          floatingActionButton:
              FloatingActionButton.extended(
            onPressed: () {
              context.push(
                AppRoutes.addCustomer,
              );
            },
            icon: const Icon(Icons.add),
            label: const Text(
              'Customer',
            ),
          ),

          body: Column(
            children: [

              Padding(
                padding:
                    const EdgeInsets.all(16),
                child: CustomerSearchBar(
                  controller:
                      _searchController,
                  onChanged: (value) {
                    setState(() {
                      _query = value;
                    });
                  },
                ),
              ),

              Expanded(
                child: customers.isEmpty
                    ? const Center(
                        child: Text(
                          'No customers found.',
                        ),
                      )
                    : ListView.separated(
                        padding:
                            const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        itemCount:
                            customers.length,
                        separatorBuilder:
                            (_, __) =>
                                const SizedBox(
                          height: 12,
                        ),
                        itemBuilder:
                            (context, index) {
                          final customer =
                              customers[index];

                          return CustomerListItem(
                            customer:
                                customer,
                            onTap: () {
                              context.push(
                                AppRoutes
                                    .customerDetails(
                                  customer.id!,
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),

            ],
          ),
        );
      },
    );
  }
}