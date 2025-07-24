import 'package:iti_flutter/models/task.dart';

abstract class TaskState {}

class TaskIntial extends TaskState {}

class TaskLoaded extends TaskState {
  final List<TaskModel> tasks;
  TaskLoaded(this.tasks);
}