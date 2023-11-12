import 'package:data_models/data_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter_hive_offline_data_sync_demo/flutter_hive_offline_data_sync_demo.dart';

class RemoteTaskRepository implements RemoteRepository<String, Task> {
  final Dio _dio = Dio();
  @override
  bool isConnected = true;

  static const baseUrl = 'http://localhost:8080';
  @override
  Future<Task> create(Task data) async {
    if (isConnected == false) {
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
    if (isConnected == false) {
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
