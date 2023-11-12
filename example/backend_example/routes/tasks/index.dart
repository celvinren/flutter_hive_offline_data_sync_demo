import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:data_models/data_models.dart';
import 'package:flutter_hive_offline_data_sync_demo/flutter_hive_offline_data_sync_demo.dart';
import 'package:hive/hive.dart';

Future<Response> onRequest(RequestContext context) async {
  final method = context.request.method;

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
      final tasks = localRepository.values.toList();
      return Response(
        body: jsonEncode({
          'result': tasks.isNotEmpty ? tasks : <Task>[],
          'error': null,
        }),
        headers: {'content-type': 'application/json'},
      );
    case HttpMethod.post:
      break;
    case HttpMethod.put:
      break;
    case HttpMethod.delete:
      break;
    default:
      // Handle any other HttpMethod values
      break;
  }

  return Response(body: 'Welcome to Dart Frog!');
}
