import 'package:flutter/material.dart';

import '../../../../shared/widgets/forms/app_form_section.dart';
import '../../../../shared/widgets/forms/app_form_spacing.dart';
import '../../../../shared/widgets/forms/fields/app_date_field.dart';
import '../../../../shared/widgets/forms/fields/app_number_field.dart';
import '../../../../shared/widgets/forms/fields/app_switch_field.dart';

import '../../controllers/product_form_controller.dart';

/// ---------------------------------------------------------------------------
/// InventoryCard
/// ---------------------------------------------------------------------------
///
/// Displays inventory-related information for a product.
///
/// Responsibilities:
/// • Opening Quantity
/// • Reorder Level
/// • Expiry Date
/// • Low Stock Alerts
///
/// Business state is managed entirely by [ProductFormController].
/// ---------------------------------------------------------------------------
class InventoryCard extends StatelessWidget {
  const InventoryCard({super.key, required this.controller});

  /// Shared product form controller.
  final ProductFormController controller;

  @override
  Widget build(BuildContext context) {
    return AppFormSection(
      title: 'Inventory',
      subtitle: 'Manage stock levels and inventory tracking.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppNumberField(
            controller: controller.quantityController,
            label: 'Opening Quantity',
            icon: Icons.inventory_2_outlined,
            allowDecimal: false,
          ),

          AppFormSpacing.fieldGap,

          AppNumberField(
            controller: controller.reorderLevelController,
            label: 'Reorder Level',
            icon: Icons.warning_amber_outlined,
            allowDecimal: false,
          ),

          // Show expiry date only when expiry tracking is enabled.
          if (controller.trackExpiry) ...[
            AppFormSpacing.fieldGap,

            AppDateField(
              controller: controller.expiryDateController,
              label: 'Expiry Date',
              icon: Icons.event_outlined,
            ),
          ],

          AppFormSpacing.fieldGap,

          AppSwitchField(
            title: 'Low Stock Alerts',
            subtitle: 'Notify when stock falls below the reorder level.',
            value: controller.lowStockAlerts,
            onChanged: controller.setLowStockAlerts,
          ),

          AppFormSpacing.sectionGap,

          Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      'Products with stock below the configured reorder level '
                      'will automatically appear in the Low Stock section of '
                      'the dashboard, helping you replenish inventory before '
                      'items run out.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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
