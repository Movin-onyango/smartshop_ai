import 'package:flutter/material.dart';

import '../../../../shared/widgets/forms/app_form_section.dart';
import '../../../../shared/widgets/forms/app_form_spacing.dart';
import '../../../../shared/widgets/forms/fields/app_dropdown_field.dart';
import '../../../../shared/widgets/forms/fields/app_switch_field.dart';
import '../../../../shared/widgets/forms/fields/app_text_area.dart';
import '../../../../shared/widgets/forms/fields/app_text_field.dart';

import '../../controllers/product_form_controller.dart';

/// ---------------------------------------------------------------------------
/// ProductInformationCard
/// ---------------------------------------------------------------------------
///
/// Handles the identity and descriptive information of a product.
///
/// Responsibilities:
/// • Product Name
/// • Category
/// • Barcode
/// • Description
/// • Track Expiry
///
/// Does NOT handle:
/// • Pricing
/// • Inventory
/// • Form Actions
/// ---------------------------------------------------------------------------
class ProductInformationCard extends StatelessWidget {
  const ProductInformationCard({
    super.key,
    required this.controller,
    required this.categories,
  });

  /// Shared form controller.
  final ProductFormController controller;

  /// Available product categories.
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return AppFormSection(
      title: 'Product Information',
      subtitle: 'Basic information used to identify the product.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            controller: controller.nameController,
            label: 'Product Name',
            hint: 'e.g. Brookside Milk 500ml',
            icon: Icons.inventory_2_outlined,
          ),

          AppFormSpacing.fieldGap,

          AppDropdownField<String>(
            label: 'Category',

            // If your AppDropdownField has been updated for Flutter 3.33,
            // replace `value:` with `initialValue:`.
            value: controller.selectedCategory,

            icon: Icons.category_outlined,
            items: categories
                .map(
                  (category) => DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  ),
                )
                .toList(),
            onChanged: controller.setCategory,
          ),

          AppFormSpacing.fieldGap,

          AppTextField(
            controller: controller.barcodeController,
            label: 'Barcode',
            hint: 'Scan or enter barcode',
            icon: Icons.qr_code_scanner_outlined,
          ),

          AppFormSpacing.fieldGap,

          AppTextArea(
            controller: controller.descriptionController,
            label: 'Description',
            hint: 'Optional product description',
            icon: Icons.description_outlined,
            maxLines: 5,
          ),

          AppFormSpacing.fieldGap,

          AppSwitchField(
            title: 'Track Expiry',
            subtitle: 'Enable expiry date tracking for this product.',
            value: controller.trackExpiry,
            onChanged: controller.setTrackExpiry,
          ),
        ],
      ),
    );
  }
}