import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../app/router/app_routes.dart';
import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../models/expense.dart';
import '../providers/expense_provider.dart';

import '../widgets/details/expense_action_buttons.dart';
import '../widgets/details/expense_attachment_section.dart';
import '../widgets/details/expense_header.dart';
import '../widgets/details/expense_information_section.dart';
import '../widgets/details/expense_notes_section.dart';
import '../widgets/details/expense_payment_section.dart';

/// ---------------------------------------------------------------------------
/// ExpenseDetailsScreen
/// ---------------------------------------------------------------------------
///
/// Displays complete information about an expense.
///
/// Used by:
/// • ExpenseListScreen
/// ---------------------------------------------------------------------------
class ExpenseDetailsScreen extends StatefulWidget {
  const ExpenseDetailsScreen({super.key, required this.expenseId});

  final String expenseId;

  @override
  State<ExpenseDetailsScreen> createState() => _ExpenseDetailsScreenState();
}

class _ExpenseDetailsScreenState extends State<ExpenseDetailsScreen> {
  bool isDeleting = false;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ExpenseProvider>();

    final Expense? expense = provider.findById(widget.expenseId);

    if (expense == null) {
      return const SmartScaffold(
        title: 'Expense',
        body: Center(child: Text('Expense not found.')),
      );
    }

    return SmartScaffold(
      title: 'Expense Details',

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          //------------------------------------------------------------------
          // Header
          //------------------------------------------------------------------
          ExpenseHeader(expense: expense),

          const SizedBox(height: 24),

          //------------------------------------------------------------------
          // Information
          //------------------------------------------------------------------
          ExpenseInformationSection(expense: expense),

          const SizedBox(height: 24),

          //------------------------------------------------------------------
          // Payment
          //------------------------------------------------------------------
          ExpensePaymentSection(expense: expense),

          const SizedBox(height: 24),

          //------------------------------------------------------------------
          // Attachment
          //------------------------------------------------------------------
          ExpenseAttachmentSection(
            expense: expense,
            onView: () {
              // TODO:
              // View attachment
            },
            onDownload: () {
              // TODO:
              // Download attachment
            },
          ),

          const SizedBox(height: 24),

          //------------------------------------------------------------------
          // Notes
          //------------------------------------------------------------------
          ExpenseNotesSection(expense: expense),

          const SizedBox(height: 32),

          //------------------------------------------------------------------
          // Actions
          //------------------------------------------------------------------
          ExpenseActionButtons(
            isDeleting: isDeleting,

            onEdit: () {
              context.push(AppRoutes.editExpense(expense.id!));
            },

            onDelete: () async {
              final confirmed =
                  await showDialog<bool>(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Delete Expense'),
                      content: const Text(
                        'Are you sure you want to delete this expense?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: const Text('Cancel'),
                        ),
                        FilledButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  ) ??
                  false;

              if (!confirmed) return;

              setState(() {
                isDeleting = true;
              });

              await provider.deleteExpense(expense.id!);

              if (!mounted) return;

              context.pop();
            },

            onShare: () {
              // TODO:
              // Export PDF
              // Share Receipt
            },
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
