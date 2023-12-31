import 'dart:io';

import 'package:dart_client_example/remote_task_repository.dart';
import 'package:data_models/data_models.dart';
import 'package:flutter_hive_offline_data_sync_demo/flutter_hive_offline_data_sync_demo.dart';
import 'package:hive/hive.dart';

void main(List<String> arguments) async {
  var path = Directory.current.path;
  Hive.init(path);
  RemoteTaskRepository remoteTaskRepository = RemoteTaskRepository();
  LocalRepository<String, Task> localTaskRepository =
      LocalRepository<String, Task>(await TypeSafeBox.init<String, Task>(
    boxName: LocalBox.task.name,
    adapter: TaskAdapter(),
  ));

  Repository<String, Task> taskRepository = Repository<String, Task>(
    localRepository: localTaskRepository,
    remoteRepository: remoteTaskRepository,
  );

  // await localTaskRepository.clear();

  // final Task task = Task(
  //   id: '087ded28-d920-4f2c-8d5c-10af3a4f7c1a',
  //   title: 'Task 1',
  //   description: 'Description 1',
  //   isCompleted: false,
  //   dateTime: DateTime.now(),
  // );
  // taskRepository.create(task.id, task);
  // final Task task2 = Task(
  //   id: '2f70c452-f10f-4809-9ca0-5a60460b9605',
  //   title: 'Task 5',
  //   description: 'Description 5',
  //   isCompleted: false,
  //   dateTime: DateTime.now(),
  // );
  // taskRepository.create(task2.id, task2);

  // final getSingleTask = taskRepository.fetchById('087ded28-d920-4f2c-8d5c-10af3a4f7c1a');

  for (var element in taskRepository.getAllValues()) {
    element.printProperties();
  }
  // taskRepository.localRepository.listen<Task>((previous, current) {
  //   try {
  //     print('++++++++++++ Sync data with server here ++++++++++++');
  //   } catch (e) {
  //     print('++++++++++++ Sync data fail handle dirty data ++++++++++++');
  //   }
  //   print(previous == current);
  //   print('------------ previous ------------');
  //   previous?.printProperties();
  //   print('------------ current ------------');
  //   current?.printProperties();
  // });

  // taskRepository.localRepository.removeListener();

  // final task =
  //     taskRepository.getValueById('087ded28-d920-4f2c-8d5c-10af3a4f7c1a');
  // final newTask = task?.copyWith(
  //   title: 'Task 1101',
  //   description: 'Description 110',
  //   isCompleted: false,
  //   dateTime: DateTime.now(),
  // );
  // if (newTask == null) return;
  // taskRepository.update(newTask.id, newTask);

  // taskRepository.deleteById('087ded28-d920-4f2c-8d5c-10af3a4f7c1a');

  // final task2 =
  //     taskRepository.getValueById('2f70c452-f10f-4809-9ca0-5a60460b9605');
  // final newTask2 = task2?.copyWith(
  //   title: 'Task 22',
  //   description: 'Description 22',
  //   isCompleted: false,
  //   dateTime: DateTime.now(),
  // );
  // if (newTask2 == null) return;
  // taskRepository.update(newTask2.id, newTask2);

  // taskRepository.localRepository
  //     .createOrUpdateAll({newTask.id: newTask, newTask2.id: newTask2});
}
