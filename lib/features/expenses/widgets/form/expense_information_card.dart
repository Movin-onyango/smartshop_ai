import 'package:flutter/material.dart';

import '../../models/expense_category.dart';

/// ---------------------------------------------------------------------------
/// ExpenseInformationCard
/// ---------------------------------------------------------------------------
///
/// General expense information.
///
/// Used by:
/// • AddExpenseScreen
/// • EditExpenseScreen
/// ---------------------------------------------------------------------------
class ExpenseInformationCard extends StatelessWidget {
  const ExpenseInformationCard({
    super.key,
    required this.titleController,
    required this.vendorController,
    required this.category,
    required this.onCategoryChanged,
  });

  final TextEditingController titleController;

  final TextEditingController vendorController;

  final ExpenseCategory category;

  final ValueChanged<ExpenseCategory?> onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Expense Information',
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Expense Title
            //------------------------------------------------------------------
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Expense Title',
                hintText: 'Enter expense title',
                prefixIcon: Icon(Icons.receipt_long),
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Expense title is required';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Vendor / Payee
            //------------------------------------------------------------------
            TextFormField(
              controller: vendorController,
              decoration: const InputDecoration(
                labelText: 'Vendor / Payee',
                hintText: 'Optional',
                prefixIcon: Icon(Icons.business),
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Category
            //------------------------------------------------------------------
            DropdownButtonFormField<ExpenseCategory>(
              initialValue: category,
              decoration: const InputDecoration(
                labelText: 'Category',
                prefixIcon: Icon(Icons.category),
                border: OutlineInputBorder(),
              ),
              items: ExpenseCategory.values
                  .map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text(category.label),
                    ),
                  )
                  .toList(),
              onChanged: onCategoryChanged,
            ),
          ],
        ),
      ),
    );
  }
}
