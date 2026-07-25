/// ---------------------------------------------------------------------------
/// ExpenseCategory
/// ---------------------------------------------------------------------------
///
/// Categories used to classify business expenses.
/// ---------------------------------------------------------------------------
enum ExpenseCategory {
  rent,
  utilities,
  electricity,
  water,
  internet,
  transport,
  fuel,
  salary,
  maintenance,
  officeSupplies,
  cleaning,
  marketing,
  taxes,
  insurance,
  software,
  equipment,
  miscellaneous,
}

extension ExpenseCategoryExtension on ExpenseCategory {
  String get label {
    switch (this) {
      case ExpenseCategory.rent:
        return 'Rent';

      case ExpenseCategory.utilities:
        return 'Utilities';

      case ExpenseCategory.electricity:
        return 'Electricity';

      case ExpenseCategory.water:
        return 'Water';

      case ExpenseCategory.internet:
        return 'Internet';

      case ExpenseCategory.transport:
        return 'Transport';

      case ExpenseCategory.fuel:
        return 'Fuel';

      case ExpenseCategory.salary:
        return 'Salary';

      case ExpenseCategory.maintenance:
        return 'Maintenance';

      case ExpenseCategory.officeSupplies:
        return 'Office Supplies';

      case ExpenseCategory.cleaning:
        return 'Cleaning';

      case ExpenseCategory.marketing:
        return 'Marketing';

      case ExpenseCategory.taxes:
        return 'Taxes';

      case ExpenseCategory.insurance:
        return 'Insurance';

      case ExpenseCategory.software:
        return 'Software';

      case ExpenseCategory.equipment:
        return 'Equipment';

      case ExpenseCategory.miscellaneous:
        return 'Miscellaneous';
    }
  }
}
