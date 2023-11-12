import 'package:data_models/data_models.dart';
import 'package:flutter_hive_offline_data_sync_demo/flutter_hive_offline_data_sync_demo.dart';

class RemoteTaskRepository implements RemoteRepository<String, Task> {
  @override
  Future<Task> create(Task data) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Task> deleteById(String id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<Task> fetchById(String id) {
    // TODO: implement fetchById
    throw UnimplementedError();
  }

  @override
  Future<Task> updateById(String id, Task data) {
    // TODO: implement updateById
    throw UnimplementedError();
  }

  Future<Task> update(Task data) async {
    return data;
  }
}
