/*
class ProductProvider
    extends BaseProvider<Product, String> {

  ProductProvider(
    ProductRepository repository,
  ) : super(repository);

  ProductRepository get _repo =>
      repository as ProductRepository;

  Product? findById(String id) =>
      _repo.getById(id);

  List<Product> search(String query) {
    final q = query.toLowerCase();

    return items.where((product) {
      return product.name
              .toLowerCase()
              .contains(q) ||
          product.category
              .toLowerCase()
              .contains(q);
    }).toList();
  }
}
*/
