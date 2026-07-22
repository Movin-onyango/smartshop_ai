import 'package:flutter/material.dart';

import '../../../../shared/widgets/forms/app_form_section.dart';
import '../../../../shared/widgets/forms/app_form_spacing.dart';
import '../../../../shared/widgets/forms/fields/app_text_area.dart';
import '../../../../shared/widgets/forms/fields/app_text_field.dart';

import '../../controllers/category_form_controller.dart';

/// ---------------------------------------------------------------------------
/// CategoryInformationCard
/// ---------------------------------------------------------------------------
///
/// Displays the editable information for a category.
///
/// Responsibilities:
/// • Category Name
/// • Description
/// • Icon Selection
/// • Color Selection
///
/// Shared by:
/// • AddCategoryScreen
/// • EditCategoryScreen
/// ---------------------------------------------------------------------------
class CategoryInformationCard extends StatelessWidget {
  const CategoryInformationCard({
    super.key,
    required this.controller,
  });

  final CategoryFormController controller;

  static const List<IconData> _icons = [
    Icons.local_drink,
    Icons.shopping_basket,
    Icons.devices,
    Icons.face,
    Icons.edit,
    Icons.fastfood,
    Icons.medication,
    Icons.checkroom,
    Icons.pets,
    Icons.home,
    Icons.kitchen,
    Icons.sports_soccer,
  ];

  static const List<Color> _colors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.red,
    Colors.purple,
    Colors.teal,
    Colors.indigo,
    Colors.pink,
    Colors.brown,
    Colors.cyan,
    Colors.deepOrange,
    Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    return AppFormSection(
      title: 'Category Information',
      subtitle: 'Basic details used to organize products.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            controller: controller.nameController,
            label: 'Category Name',
            hint: 'e.g. Beverages',
            icon: Icons.category_outlined,
          ),

          AppFormSpacing.fieldGap,

          AppTextArea(
            controller: controller.descriptionController,
            label: 'Description',
            hint: 'Optional category description',
            icon: Icons.description_outlined,
            maxLines: 4,
          ),

          AppFormSpacing.sectionGap,

          Text(
            'Category Icon',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _icons.map((icon) {
              final selected =
                  controller.selectedIcon == icon.codePoint;

              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () =>
                    controller.setIcon(icon.codePoint),
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: selected
                        ? Theme.of(context)
                            .colorScheme
                            .primaryContainer
                        : Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                  child: Icon(icon),
                ),
              );
            }).toList(),
          ),

          AppFormSpacing.sectionGap,

          Text(
            'Category Color',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _colors.map((color) {
              final selected =
                  controller.selectedColor == color.toARGB32();

              return InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () =>
                    controller.setColor(color.toARGB32()),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selected
                          ? Colors.black
                          : Colors.transparent,
                      width: 3,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}