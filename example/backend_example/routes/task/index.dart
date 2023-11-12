import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:data_models/data_models.dart';
import 'package:flutter_hive_offline_data_sync_demo/flutter_hive_offline_data_sync_demo.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

Future<Response> onRequest(RequestContext context) async {
  final method = context.request.method;
  final body = jsonDecode(await context.request.body()) as Map<String, dynamic>;
  final taskMap =
      body.containsKey('data') ? body['data'] as Map<String, dynamic> : null;
  if (taskMap == null) {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: jsonEncode({
        'result': null,
        'error': 'taskMap is null',
      }),
      headers: {'content-type': 'application/json'},
    );
  }
  final taskIdCheck = taskMap.containsKey('id')
      ? taskMap
      : (taskMap..addEntries([MapEntry('id', const Uuid().v4())]));
  final taskDateTimeCheck = taskIdCheck.containsKey('dateTime') &&
          taskIdCheck['dateTime'] != null
      ? taskIdCheck
      : (taskIdCheck
        ..addEntries([MapEntry('dateTime', DateTime.now().toIso8601String())]));
  final task = Task.fromJson(taskDateTimeCheck);

  final path = Directory.current.path;
  Hive.init(path);
  final localRepository = LocalRepository<String, Task>(
    await TypeSafeBox.init<String, Task>(
      boxName: LocalBox.task.name,
      adapter: TaskAdapter(),
    ),
  );

  switch (method) {
    case HttpMethod.get:
      final newTask = localRepository.getSingle(task.id);
      return Response(
        body: jsonEncode({
          'result': newTask,
          'error': null,
        }),
        headers: {'content-type': 'application/json'},
      );
    case HttpMethod.post:
      localRepository.createOrUpdateSingle(task.id, task);

      return Response(
        body: jsonEncode({
          'result': task,
          'error': null,
        }),
        headers: {'content-type': 'application/json'},
      );
    case HttpMethod.put:
      break;
    case HttpMethod.delete:
      localRepository.deleteSingle(task.id);
      return Response(
        body: jsonEncode({
          'result': 'delete successfully',
          'error': null,
        }),
        headers: {'content-type': 'application/json'},
      );
    default:
      break;
  }

  return Response(body: 'Welcome to Dart Frog!');
}
