import 'package:iti_flutter/models/todo.dart';

abstract class TodoState {}

class TodoIntial extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoModel> todos;

  TodoLoaded(this.todos);
}
