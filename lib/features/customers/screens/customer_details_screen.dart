import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../models/customer.dart';
import '../providers/customer_provider.dart';

import '../widgets/details/customer_header.dart';
import '../widgets/details/contact_information.dart';
import '../widgets/details/credit_summary.dart';
import '../widgets/details/loyalty_summary.dart';
import '../widgets/details/purchase_summary.dart';
import '../widgets/details/customer_notes.dart';

/// ---------------------------------------------------------------------------
/// CustomerDetailsScreen
/// ---------------------------------------------------------------------------
///
/// Displays complete customer information.
///
/// Responsibilities:
/// • Customer profile
/// • Contact information
/// • Credit summary
/// • Loyalty summary
/// • Purchase statistics
/// • Notes
/// ---------------------------------------------------------------------------
class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({
    super.key,
    required this.customerId,
  });

  final String customerId;

  @override
  Widget build(BuildContext context) {
    final provider =
        context.watch<CustomerProvider>();

    final Customer? customer =
        provider.findById(customerId);

    if (customer == null) {
      return const Scaffold(
        body: Center(
          child: Text(
            'Customer not found.',
          ),
        ),
      );
    }

    return SmartScaffold(
      title: customer.name,

      actions: [

        IconButton(
          icon: const Icon(Icons.edit),
          tooltip: 'Edit Customer',
          onPressed: () {
            context.push(
              AppRoutes.editCustomer(
                customer.id!,
              ),
            );
          },
        ),

        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'delete') {
              provider.deleteCustomer(
                customer.id!,
              );

              context.pop();
            }
          },
          itemBuilder: (context) => const [

            PopupMenuItem(
              value: 'delete',
              child: Text(
                'Delete Customer',
              ),
            ),

          ],
        ),

      ],

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            CustomerHeader(
              customer: customer,
            ),

            const SizedBox(height: 24),

            ContactInformation(
              customer: customer,
            ),

            const SizedBox(height: 24),

            CreditSummary(
              customer: customer,
            ),

            const SizedBox(height: 24),

            LoyaltySummary(
              customer: customer,
            ),

            const SizedBox(height: 24),

            PurchaseSummary(
              customer: customer,
            ),

            const SizedBox(height: 24),

            CustomerNotes(
              customer: customer,
            ),

            const SizedBox(height: 40),

          ],
        ),
      ),
    );
  }
}