import '../models/expense.dart';
import '../models/expense_attachment.dart';
import '../models/expense_category.dart';
import '../models/expense_status.dart';

/// ---------------------------------------------------------------------------
/// ExpenseRepository
/// ---------------------------------------------------------------------------
///
/// Temporary in-memory repository.
///
/// This will later be replaced with:
/// • SQLite
/// • REST API
/// • Firebase
/// ---------------------------------------------------------------------------
class ExpenseRepository {
  ExpenseRepository._();

  static final List<Expense> _expenses = [
    Expense(
      id: '1',
      expenseNumber: 'EXP-000001',
      title: 'Shop Rent',
      category: ExpenseCategory.rent,
      amount: 25000,
      tax: 0,
      vendor: 'ABC Properties',
      paymentMethod: 'Bank Transfer',
      expenseDate: DateTime.now().subtract(
        const Duration(days: 10),
      ),
      paidDate: DateTime.now().subtract(
        const Duration(days: 9),
      ),
      status: ExpenseStatus.paid,
      notes: 'Monthly shop rent.',
      attachment: ExpenseAttachment(
        id: '1',
        fileName: 'rent_receipt.pdf',
        filePath: '/documents/rent_receipt.pdf',
        fileType: 'pdf',
        fileSize: 245760,
        uploadedAt: DateTime.now().subtract(
          const Duration(days: 9),
        ),
      ),
      createdAt: DateTime.now().subtract(
        const Duration(days: 10),
      ),
      updatedAt: DateTime.now().subtract(
        const Duration(days: 9),
      ),
    ),

    Expense(
      id: '2',
      expenseNumber: 'EXP-000002',
      title: 'Electricity Bill',
      category: ExpenseCategory.electricity,
      amount: 6850,
      tax: 16,
      vendor: 'Kenya Power',
      paymentMethod: 'M-Pesa',
      expenseDate: DateTime.now().subtract(
        const Duration(days: 5),
      ),
      dueDate: DateTime.now().add(
        const Duration(days: 5),
      ),
      status: ExpenseStatus.pending,
      notes: 'July electricity bill.',
      createdAt: DateTime.now().subtract(
        const Duration(days: 5),
      ),
      updatedAt: DateTime.now().subtract(
        const Duration(days: 5),
      ),
    ),

    Expense(
      id: '3',
      expenseNumber: 'EXP-000003',
      title: 'Office Supplies',
      category: ExpenseCategory.officeSupplies,
      amount: 4200,
      tax: 16,
      vendor: 'Stationery World',
      paymentMethod: 'Cash',
      expenseDate: DateTime.now().subtract(
        const Duration(days: 2),
      ),
      status: ExpenseStatus.approved,
      notes: 'Printer paper and pens.',
      createdAt: DateTime.now().subtract(
        const Duration(days: 2),
      ),
      updatedAt: DateTime.now().subtract(
        const Duration(days: 2),
      ),
    ),
  ];

  //--------------------------------------------------------------------------
  // CRUD
  //--------------------------------------------------------------------------

  static List<Expense> getAll() {
    return List.unmodifiable(_expenses);
  }

  static Expense? findById(
    String id,
  ) {
    try {
      return _expenses.firstWhere(
        (expense) => expense.id == id,
      );
    } catch (_) {
      return null;
    }
  }

  static void add(
    Expense expense,
  ) {
    _expenses.add(
      expense.copyWith(
        id: DateTime.now()
            .millisecondsSinceEpoch
            .toString(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
  }

  static void update(
    Expense expense,
  ) {
    final index = _expenses.indexWhere(
      (item) => item.id == expense.id,
    );

    if (index == -1) return;

    _expenses[index] = expense.copyWith(
      updatedAt: DateTime.now(),
    );
  }

  static void delete(
    String id,
  ) {
    _expenses.removeWhere(
      (expense) => expense.id == id,
    );
  }
}