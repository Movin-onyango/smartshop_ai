import 'package:flutter/material.dart';

import '../../../../shared/widgets/forms/app_form_section.dart';
import '../../../../shared/widgets/forms/app_form_spacing.dart';
import '../../../../shared/widgets/forms/fields/app_number_field.dart';

import '../../controllers/product_form_controller.dart';

class PricingCard extends StatelessWidget {
  const PricingCard({
    super.key,
    required this.controller,
  });

  final ProductFormController controller;

  @override
  Widget build(BuildContext context) {
    return AppFormSection(
      title: 'Pricing',
      subtitle: 'Configure selling and buying prices.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppNumberField(
            controller: controller.buyingPriceController,
            label: 'Buying Price',
            prefixText: 'KES ',
            icon: Icons.shopping_cart_outlined,
          ),

          AppFormSpacing.fieldGap,

          AppNumberField(
            controller: controller.sellingPriceController,
            label: 'Selling Price',
            prefixText: 'KES ',
            icon: Icons.sell_outlined,
          ),

          AppFormSpacing.fieldGap,

          AppNumberField(
            controller: controller.discountController,
            label: 'Discount',
            suffixText: '%',
            icon: Icons.percent_outlined,
            allowDecimal: true,
          ),

          AppFormSpacing.sectionGap,

          Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _SummaryRow(
                    label: 'Effective Selling Price',
                    value:
                        'KES ${controller.effectiveSellingPrice.toStringAsFixed(2)}',
                  ),

                  const Divider(),

                  _SummaryRow(
                    label: 'Profit Per Unit',
                    value:
                        'KES ${controller.profit.toStringAsFixed(2)}',
                  ),

                  const Divider(),

                  _SummaryRow(
                    label: 'Profit Margin',
                    value:
                        '${controller.margin.toStringAsFixed(1)}%',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}