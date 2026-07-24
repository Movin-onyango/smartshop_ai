import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../controllers/expense_form_controller.dart';
import '../models/expense.dart';
import '../providers/expense_provider.dart';

import '../widgets/form/expense_actions.dart';
import '../widgets/form/expense_attachment_card.dart';
import '../widgets/form/expense_information_card.dart';
import '../widgets/form/expense_notes_card.dart';
import '../widgets/form/expense_payment_card.dart';

/// ---------------------------------------------------------------------------
/// EditExpenseScreen
/// ---------------------------------------------------------------------------
///
/// Edit an existing expense.
/// ---------------------------------------------------------------------------
class EditExpenseScreen extends StatefulWidget {
  const EditExpenseScreen({
    super.key,
    required this.expenseId,
  });

  final String expenseId;

  @override
  State<EditExpenseScreen> createState() =>
      _EditExpenseScreenState();
}

class _EditExpenseScreenState
    extends State<EditExpenseScreen> {
  late Expense expense;

  late ExpenseFormController controller;

  bool _initialized = false;

  bool isSaving = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) {
      return;
    }

    expense = context
        .read<ExpenseProvider>()
        .findById(widget.expenseId)!;

    controller =
        ExpenseFormController.fromExpense(
      expense,
    );

    _initialized = true;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!controller.validate()) {
      return;
    }

    setState(() {
      isSaving = true;
    });

    await context
        .read<ExpenseProvider>()
        .updateExpense(
          controller.toExpense(
            id: expense.id,
            expenseNumber:
                expense.expenseNumber,
          ),
        );

    if (!mounted) return;

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (_, __) {
        return SmartScaffold(
          title: 'Edit Expense',

          body: Form(
            key: controller.formKey,
            child: ListView(
              padding:
                  const EdgeInsets.all(16),
              children: [
                ExpenseInformationCard(
                  titleController:
                      controller
                          .titleController,
                  vendorController:
                      controller
                          .vendorController,
                  category:
                      controller.category,
                  onCategoryChanged:
                      (value) {
                    if (value != null) {
                      controller
                          .setCategory(
                        value,
                      );
                    }
                  },
                ),

                const SizedBox(height: 24),

                ExpensePaymentCard(
                  amountController:
                      controller
                          .amountController,
                  taxController:
                      controller
                          .taxController,
                  paymentMethodController:
                      controller
                          .paymentMethodController,
                  status:
                      controller.status,
                  onStatusChanged:
                      (value) {
                    if (value != null) {
                      controller
                          .setStatus(
                        value,
                      );
                    }
                  },
                  expenseDate:
                      controller
                          .expenseDate,
                  dueDate:
                      controller.dueDate,
                  onExpenseDateTap:
                      () {},
                  onDueDateTap:
                      () {},
                ),

                const SizedBox(height: 24),

                ExpenseAttachmentCard(
                  attachment:
                      controller
                          .attachment,
                  onAttach: () {},
                  onRemove: () {
                    controller
                        .setAttachment(
                      null,
                    );
                  },
                ),

                const SizedBox(height: 24),

                ExpenseNotesCard(
                  notesController:
                      controller
                          .notesController,
                ),

                const SizedBox(height: 32),

                ExpenseActions(
                  isLoading:
                      isSaving,
                  isEditing: true,
                  onSave: _save,
                  onCancel: () {
                    context.pop();
                  },
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }
}