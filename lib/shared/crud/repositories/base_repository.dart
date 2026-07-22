/// ---------------------------------------------------------------------------
/// BaseRepository
/// ---------------------------------------------------------------------------
///
/// Generic CRUD contract.
///
/// Every repository in the application implements this.
///
/// Examples:
///
/// ProductRepository
/// SupplierRepository
/// CustomerRepository
/// ExpenseRepository
/// SaleRepository
/// ---------------------------------------------------------------------------
abstract class BaseRepository<T, ID> {
  List<T> getAll();

  T? getById(ID id);

  void add(T item);

  void update(T item);

  void delete(ID id);
}