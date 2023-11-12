abstract class RemoteRepository<K, T> {
  bool isConnected = true;

  Future<T> fetchById(K id);

  Future<T> create(T data);

  Future<T> updateById(K id, T data);

  Future<T> deleteById(K id);
}
