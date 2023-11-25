import 'dart:io';

import 'package:dart_client_example/remote_task_repository.dart';
import 'package:data_models/data_models.dart';
import 'package:flutter_hive_offline_data_sync_demo/flutter_hive_offline_data_sync_demo.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

void main(List<String> arguments) async {
  var path = Directory.current.path;
  Hive.init(path);

  List<String> options = [
    'Set remote repo offline',
    'Set remote repo online',
    'Get all tasks',
    'Create a task',
    'Exit'
  ];
  int selectedIndex = 0;

  final menuAction = await MenuAction.init();

  while (true) {
    print('Select an option:');
    for (int i = 0; i < options.length; i++) {
      if (i == selectedIndex) {
        print('[${i + 1}] -> ${options[i]} <-');
      } else {
        print('[${i + 1}]    ${options[i]}');
      }
    }

    String? choice = stdin.readLineSync();
    if (choice != null && int.tryParse(choice) != null) {
      selectedIndex = int.parse(choice) - 1;

      if (selectedIndex < 0 || selectedIndex >= options.length) {
        print('Invalid choice. Please try again.');
        continue;
      }

      if (options[selectedIndex] == 'Exit') {
        print('Exiting...');
        break;
      }

      print('You selected "${options[selectedIndex]}"');
      // Handle the selected option with your logic
      await menuAction.menuSelection(selectedIndex);
    } else {
      print('Please enter a valid number.');
    }
  }
}

class MenuAction {
  MenuAction();
  static Future<MenuAction> init() async {
    final remoteTaskRepository = RemoteTaskRepository();
    final localTaskRepository =
        LocalRepository<String, Task>(await TypeSafeBox.init<String, Task>(
      boxName: LocalBox.task.name,
      adapter: TaskAdapter(),
    ));

    final menu = MenuAction();
    menu.taskRepository = Repository<String, Task>(
      localRepository: localTaskRepository,
      remoteRepository: remoteTaskRepository,
    );
    return menu;
  }

  late Repository<String, Task> taskRepository;

  void setRemoteRepositoryConnectivity({bool isConnected = true}) {
    (taskRepository.remoteRepository as RemoteTaskRepository).setIsConnected(
      isConnected: isConnected,
    );
  }

  List<Task> getAllTasks() {
    return taskRepository.getAllValues();
  }

  Future<Task?> createTask(Task task) async {
    return taskRepository.create(task.id, task);
  }

  Future<void> menuSelection(int option) async {
    switch (option) {
      case 0:
        setRemoteRepositoryConnectivity(isConnected: false);
        break;
      case 1:
        setRemoteRepositoryConnectivity(isConnected: true);
        break;
      case 2:
        print('--------------------------');
        final allTasks = getAllTasks();
        print('allTasks length: ${allTasks.length}');
        for (var e in allTasks) {
          e.printProperties();
        }
        print('--------------------------');
        break;
      case 3:
        print('--------------------------');
        print('Task title:');
        String? taskTitle = stdin.readLineSync();
        print('Task description:');
        String? taskDescription = stdin.readLineSync();
        final task = Task(
          id: Uuid().v4(),
          title: taskTitle,
          description: taskDescription,
          isCompleted: false,
          modifiedAt: DateTime.now(),
        );
        await createTask(task);
        print('--------------------------');
        break;
      default:
    }
  }
}
