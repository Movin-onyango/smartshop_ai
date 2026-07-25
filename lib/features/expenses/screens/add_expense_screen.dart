import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/layouts/smart_scaffold.dart';

import '../controllers/expense_form_controller.dart';
import '../providers/expense_provider.dart';

import '../widgets/form/expense_actions.dart';
import '../widgets/form/expense_attachment_card.dart';
import '../widgets/form/expense_information_card.dart';
import '../widgets/form/expense_notes_card.dart';
import '../widgets/form/expense_payment_card.dart';

/// ---------------------------------------------------------------------------
/// AddExpenseScreen
/// ---------------------------------------------------------------------------
///
/// Creates a new expense.
/// ---------------------------------------------------------------------------
class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  late final ExpenseFormController controller;

  bool isSaving = false;

  @override
  void initState() {
    super.initState();
    controller = ExpenseFormController();
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

    await context.read<ExpenseProvider>().addExpense(controller.toExpense());

    if (!mounted) return;

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (_, __) {
        return SmartScaffold(
          title: 'Add Expense',

          body: Form(
            key: controller.formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ExpenseInformationCard(
                  titleController: controller.titleController,
                  vendorController: controller.vendorController,
                  category: controller.category,
                  onCategoryChanged: (value) {
                    if (value != null) {
                      controller.setCategory(value);
                    }
                  },
                ),

                const SizedBox(height: 24),

                ExpensePaymentCard(
                  amountController: controller.amountController,
                  taxController: controller.taxController,
                  paymentMethodController: controller.paymentMethodController,
                  status: controller.status,
                  onStatusChanged: (value) {
                    if (value != null) {
                      controller.setStatus(value);
                    }
                  },
                  expenseDate: controller.expenseDate,
                  dueDate: controller.dueDate,
                  onExpenseDateTap: () {},
                  onDueDateTap: () {},
                ),

                const SizedBox(height: 24),

                ExpenseAttachmentCard(
                  attachment: controller.attachment,
                  onAttach: () {},
                  onRemove: () {
                    controller.setAttachment(null);
                  },
                ),

                const SizedBox(height: 24),

                ExpenseNotesCard(notesController: controller.notesController),

                const SizedBox(height: 32),

                ExpenseActions(
                  isLoading: isSaving,
                  isEditing: false,
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
