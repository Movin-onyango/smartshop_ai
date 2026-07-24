import 'package:flutter/material.dart';

import '../../models/expense_status.dart';

/// ---------------------------------------------------------------------------
/// ExpensePaymentCard
/// ---------------------------------------------------------------------------
///
/// Payment information.
///
/// Used by:
/// • AddExpenseScreen
/// • EditExpenseScreen
/// ---------------------------------------------------------------------------
class ExpensePaymentCard extends StatelessWidget {
  const ExpensePaymentCard({
    super.key,
    required this.amountController,
    required this.taxController,
    required this.paymentMethodController,
    required this.status,
    required this.onStatusChanged,
    required this.expenseDate,
    required this.dueDate,
    required this.onExpenseDateTap,
    required this.onDueDateTap,
  });

  final TextEditingController amountController;

  final TextEditingController taxController;

  final TextEditingController paymentMethodController;

  final ExpenseStatus status;

  final ValueChanged<ExpenseStatus?> onStatusChanged;

  final DateTime expenseDate;

  final DateTime? dueDate;

  final VoidCallback onExpenseDateTap;

  final VoidCallback onDueDateTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Information',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Amount
            //------------------------------------------------------------------

            TextFormField(
              controller: amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Amount',
                prefixIcon: Icon(Icons.payments),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                final amount =
                    double.tryParse(value ?? '');

                if (amount == null ||
                    amount <= 0) {
                  return 'Enter a valid amount';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Tax
            //------------------------------------------------------------------

            TextFormField(
              controller: taxController,
              keyboardType:
                  const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Tax (%)',
                prefixIcon:
                    Icon(Icons.percent),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Payment Method
            //------------------------------------------------------------------

            TextFormField(
              controller:
                  paymentMethodController,
              decoration:
                  const InputDecoration(
                labelText:
                    'Payment Method',
                prefixIcon: Icon(
                  Icons.account_balance_wallet,
                ),
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            //------------------------------------------------------------------
            // Status
            //------------------------------------------------------------------

            DropdownButtonFormField<
                ExpenseStatus>(
              initialValue: status,
              decoration:
                  const InputDecoration(
                labelText: 'Status',
                prefixIcon:
                    Icon(Icons.flag),
                border:
                    OutlineInputBorder(),
              ),
              items: ExpenseStatus.values
                  .map(
                    (status) =>
                        DropdownMenuItem(
                      value: status,
                      child: Text(
                        status.label,
                      ),
                    ),
                  )
                  .toList(),
              onChanged:
                  onStatusChanged,
            ),

            const SizedBox(height: 20),

            //------------------------------------------------------------------
            // Expense Date
            //------------------------------------------------------------------

            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.calendar_today,
              ),
              title:
                  const Text('Expense Date'),
              subtitle: Text(
                '${expenseDate.day}/${expenseDate.month}/${expenseDate.year}',
              ),
              trailing:
                  const Icon(Icons.edit),
              onTap: onExpenseDateTap,
            ),

            //------------------------------------------------------------------
            // Due Date
            //------------------------------------------------------------------

            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.event,
              ),
              title:
                  const Text('Due Date'),
              subtitle: Text(
                dueDate == null
                    ? 'Not set'
                    : '${dueDate!.day}/${dueDate!.month}/${dueDate!.year}',
              ),
              trailing:
                  const Icon(Icons.edit),
              onTap: onDueDateTap,
            ),
          ],
        ),
      ),
    );
  }
}