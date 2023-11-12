import 'package:data_models/data_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_hive_offline_data_sync_demo/flutter_hive_offline_data_sync_demo.dart';
import 'package:rxdart/rxdart.dart';

class RemoteTaskRepository implements RemoteRepository<String, Task> {
  final Dio _dio = Dio();
  final isConnectedStreamController = BehaviorSubject<bool>.seeded(
    true,
  );
  Stream<bool> getIsConnectedStream() =>
      isConnectedStreamController.asBroadcastStream();

  static const baseUrl = 'http://localhost:8080';

  void setIsConnected({bool isConnected = true}) {
    isConnectedStreamController.add(isConnected);
  }

  @override
  Future<Task> create(Task data) async {
    final isConnected = await getIsConnectedStream().first;
    print(isConnected);
    if (isConnected != true) {
      throw Exception('No internet connection');
    }

    final response = await _dio.post(
      '$baseUrl/task',
      data: {"data": data.toJson()},
    );
    final result = response.data['result'];
    return Task.fromJson(result);
  }

  @override
  Future<Task> deleteById(String id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<Task> fetchById(String id) async {
    final isConnected = await getIsConnectedStream().first;
    print(isConnected);
    if (isConnected != true) {
      throw Exception('No internet connection');
    }

    final response = await _dio.get('$baseUrl/task/$id');
    final result = response.data['result'];
    return Task.fromJson(result);
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
