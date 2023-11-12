import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';

class LocalRepository<K, T extends Equatable> {
  LocalRepository(this.box);

  final TypeSafeBox<K, T> box;

  Iterable<T> get values => box.values;

  Iterable<K> get keys => box.keys;

  int get length => box.length;

  bool get isEmpty => box.isEmpty;

  bool get isNotEmpty => box.isNotEmpty;

  bool containsKey(K key) => box.containsKey(key);

  Map<K, T> toMap() => box.toMap();

  Future<void> clear() => box.clear();

  void createOrUpdateSingle(K key, T value) => box.put(key, value);

  void createOrUpdateAll(Map<K, T> entries) => box.putAll(entries);

  void deleteSingle(K key) => box.delete(key);

  void deleteAll(Iterable<K> keys) => box.deleteAll(keys);

  T? getSingle(K key) => box.get(key);

  T? getAt(int index) => box.getAt(index);

  void listen<T>(void Function(T? previous, T? current) listener) =>
      box.listen<T>(listener);

  void removeListener() => box.removeListener();
}
