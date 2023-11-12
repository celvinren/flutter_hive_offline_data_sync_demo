import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_hive_offline_data_sync_demo/src/local_repository.dart';
import 'package:flutter_hive_offline_data_sync_demo/src/remote_repository.dart';

class Repository<K, T extends Equatable> {
  Repository({required this.localRepository, required this.remoteRepository});

  final LocalRepository<K, T> localRepository;
  final RemoteRepository<K, T> remoteRepository;

  T? getValueById(K id) {
    return localRepository.getSingle(id);
  }

  List<T> getValuesByIds(List<K> ids) {
    return [for (var id in ids) localRepository.getSingle(id)]
        .whereNotNull()
        .toList();
  }

  List<T> getAllValues() {
    return localRepository.values.map((e) => e).toList();
  }

  Future<T?> create(K key, T data) async {
    localRepository.createOrUpdateSingle(key, data);
    try {
      return await remoteRepository.create(data);
    } catch (e) {
      print('++++++++++++ Create data fail ++++++++++++');
    }
    return null;
  }

  Future<T?> update(K key, T data) async {
    localRepository.createOrUpdateSingle(key, data);
    try {
      return await remoteRepository.updateById(key, data);
    } catch (e) {
      print('++++++++++++ Update data fail ++++++++++++');
    }
    return null;
  }

  Future<T?> deleteById(K id) async {
    localRepository.deleteSingle(id);
    try {
      return await remoteRepository.deleteById(id);
    } catch (e) {
      print('++++++++++++ Delete data fail ++++++++++++');
    }
    return null;
  }
}
