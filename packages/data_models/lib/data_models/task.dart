import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'helper.dart/hive_adapter.dart';

part 'task.freezed.dart';
part 'task.g.dart';

mixin PrintProperties {
  String get id;
  String? get title;
  String? get description;
  bool? get isCompleted;
  DateTime? get dateTime;

  void printProperties() {
    print('=======================================');
    print('id: $id');
    print('title: $title');
    print('description: $description');
    print('isCompleted: $isCompleted');
    print('dateTime: $dateTime');
  }
}

@freezed
class Task extends Equatable with _$Task, PrintProperties {
  const Task._();

  factory Task({
    required String id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? dateTime,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        isCompleted,
      ];
}

class TaskAdapter extends JsonTypeAdapter<Task> {
  @override
  final typeId = LocalBox.task.boxTypeId;

  @override
  Task fromJson(json) => Task.fromJson(json);

  @override
  Map<String, dynamic> toJson(Task obj) => obj.toJson();
}
