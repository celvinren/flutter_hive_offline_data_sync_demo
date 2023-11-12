abstract class RemoteRepository<K, T> {
  Future<T> fetchById(K id);

  Future<T> create(T data);

  Future<T> updateById(K id, T data);

  Future<T> deleteById(K id);
}
