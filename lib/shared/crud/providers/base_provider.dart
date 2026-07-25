import 'package:flutter/foundation.dart';

import '../repositories/base_repository.dart';

/// Generic CRUD provider.
///
/// Feature providers extend this class.
abstract class BaseProvider<T, ID> extends ChangeNotifier {
  BaseProvider(this.repository);

  final BaseRepository<T, ID> repository;

  final List<T> _items = [];

  List<T> get items => List.unmodifiable(_items);

  void load() {
    _items
      ..clear()
      ..addAll(repository.getAll());

    notifyListeners();
  }

  void add(T item) {
    repository.add(item);
    load();
  }

  void update(T item) {
    repository.update(item);
    load();
  }

  void delete(ID id) {
    repository.delete(id);
    load();
  }
}
