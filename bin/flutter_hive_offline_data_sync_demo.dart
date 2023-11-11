import 'dart:io';

import 'package:flutter_hive_offline_data_sync_demo/data_models/helper.dart/hive_adapter.dart';
import 'package:flutter_hive_offline_data_sync_demo/data_models/task.dart';
import 'package:hive/hive.dart';

// import 'package:uuid/uuid.dart';

void main(List<String> arguments) async {
  var path = Directory.current.path;
  Hive.init(path);

  final taskBox = await TypeSafeBox.init<String, Task>(
    boxName: LocalBox.task.name,
    adapter: TaskAdapter(),
  );
  // await taskBox.clear();
  // final Task task = Task(
  //   id: const Uuid().v4(),
  //   title: 'Task 1',
  //   description: 'Description 1',
  //   isCompleted: false,
  //   dateTime: DateTime.now(),
  // );
  // taskBox.put(task.id, task);

  for (var element in taskBox.values) {
    element.printProperties();
  }
  taskBox.listen<Task>((previous, current) {
    try {
      print('++++++++++++ Sync data with server here ++++++++++++');
    } catch (e) {
      print('++++++++++++ Sync data fail handle dirty data ++++++++++++');
    }
    print(previous == current);
    print('previous');
    previous?.printProperties();
    print('current');
    current?.printProperties();
  });
  // taskBox.removeListener();

  final task = taskBox.get('1ccd646e-8536-40c5-845a-765942f11c13');
  final newTask = task?.copyWith(
    title: 'Task 1101',
    description: 'Description 110',
    isCompleted: false,
    dateTime: DateTime.now(),
  );
  if (newTask == null) return;
  taskBox.put(newTask.id, newTask);

  // taskBox.delete('1ccd646e-8536-40c5-845a-765942f11c13');

  final task2 = taskBox.get('d9b948da-c626-4439-b2d3-97157b1dc8f7');
  final newTask2 = task2?.copyWith(
    title: 'Task 22',
    description: 'Description 22',
    isCompleted: false,
    dateTime: DateTime.now(),
  );
  if (newTask2 == null) return;
  taskBox.put(newTask2.id, newTask2);

  // taskBox.putAll({newTask.id: newTask, newTask2.id: newTask2});
}
