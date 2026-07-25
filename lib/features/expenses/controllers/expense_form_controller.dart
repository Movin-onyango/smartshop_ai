import 'package:flutter/material.dart';

import '../models/expense.dart';
import '../models/expense_attachment.dart';
import '../models/expense_category.dart';
import '../models/expense_status.dart';

/// ---------------------------------------------------------------------------
/// ExpenseFormController
/// ---------------------------------------------------------------------------
///
/// Manages:
/// • Create Expense
/// • Edit Expense
/// ---------------------------------------------------------------------------
class ExpenseFormController extends ChangeNotifier {
  //--------------------------------------------------------------------------
  // Form Key
  //--------------------------------------------------------------------------

  final formKey = GlobalKey<FormState>();

  //--------------------------------------------------------------------------
  // Controllers
  //--------------------------------------------------------------------------

  final titleController = TextEditingController();

  final vendorController = TextEditingController();

  final amountController = TextEditingController();

  final taxController = TextEditingController();

  final paymentMethodController = TextEditingController();

  final notesController = TextEditingController();

  //--------------------------------------------------------------------------
  // Fields
  //--------------------------------------------------------------------------

  ExpenseCategory category = ExpenseCategory.miscellaneous;

  ExpenseStatus status = ExpenseStatus.draft;

  DateTime expenseDate = DateTime.now();

  DateTime? dueDate;

  DateTime? paidDate;

  ExpenseAttachment? attachment;

  //--------------------------------------------------------------------------
  // Constructors
  //--------------------------------------------------------------------------

  ExpenseFormController();

  ExpenseFormController.fromExpense(Expense expense) {
    titleController.text = expense.title;

    vendorController.text = expense.vendor ?? '';

    amountController.text = expense.amount.toString();

    taxController.text = expense.tax.toString();

    paymentMethodController.text = expense.paymentMethod ?? '';

    notesController.text = expense.notes ?? '';

    category = expense.category;
    status = expense.status;
    expenseDate = expense.expenseDate;
    dueDate = expense.dueDate;
    paidDate = expense.paidDate;
    attachment = expense.attachment;
  }

  //--------------------------------------------------------------------------
  // Setters
  //--------------------------------------------------------------------------

  void setCategory(ExpenseCategory value) {
    category = value;
    notifyListeners();
  }

  void setStatus(ExpenseStatus value) {
    status = value;
    notifyListeners();
  }

  void setExpenseDate(DateTime value) {
    expenseDate = value;
    notifyListeners();
  }

  void setDueDate(DateTime? value) {
    dueDate = value;
    notifyListeners();
  }

  void setPaidDate(DateTime? value) {
    paidDate = value;
    notifyListeners();
  }

  void setAttachment(ExpenseAttachment? value) {
    attachment = value;
    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Validation
  //--------------------------------------------------------------------------

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  //--------------------------------------------------------------------------
  // Conversion
  //--------------------------------------------------------------------------

  Expense toExpense({String? id, String? expenseNumber}) {
    return Expense(
      id: id,

      expenseNumber:
          expenseNumber ?? 'EXP-${DateTime.now().millisecondsSinceEpoch}',

      title: titleController.text.trim(),

      category: category,

      amount: double.tryParse(amountController.text) ?? 0,

      tax: double.tryParse(taxController.text) ?? 0,

      vendor: vendorController.text.trim().isEmpty
          ? null
          : vendorController.text.trim(),

      paymentMethod: paymentMethodController.text.trim().isEmpty
          ? null
          : paymentMethodController.text.trim(),

      expenseDate: expenseDate,

      dueDate: dueDate,

      paidDate: paidDate,

      status: status,

      notes: notesController.text.trim().isEmpty
          ? null
          : notesController.text.trim(),

      attachment: attachment,

      createdAt: DateTime.now(),

      updatedAt: DateTime.now(),
    );
  }

  //--------------------------------------------------------------------------
  // Dispose
  //--------------------------------------------------------------------------

  @override
  void dispose() {
    titleController.dispose();
    vendorController.dispose();
    amountController.dispose();
    taxController.dispose();
    paymentMethodController.dispose();
    notesController.dispose();
    super.dispose();
  }
}
