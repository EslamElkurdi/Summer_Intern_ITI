import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/cubit/todo_cubit/todo_state.dart';
import 'package:iti_flutter/models/todo.dart';

class TodoCubit extends Cubit<TodoState> {
  static final TodoCubit _instance = TodoCubit._internal();

  factory TodoCubit() => _instance;

  TodoCubit._internal() : super(TodoIntial());

  List<TodoModel> _todos = [];

  void loadIntialData() {
    _todos = [];

    emit(TodoLoaded(_todos));
  }

  void addTodo(String title) {
    final todo = TodoModel(
      id: DateTime.now().microsecond,
      title: title,
      isDone: false,
    );

    _todos.add(todo);

    emit(TodoLoaded(List.from(_todos)));
  }

  void toggleDone(int id) {
    _todos =
        _todos.map((todo) {
          if (todo.id == id) {
            return todo.coptWith(isDone: !todo.isDone);
          }

          return todo;
        }).toList();

    emit(TodoLoaded(List.from(_todos)));
  }

  void deleteTodo(int id) {
    _todos.removeWhere((todo) => todo.id == id);
    emit(TodoLoaded(List.from(_todos)));
  }


  List<TodoModel> get currentTodos => _todos;

}
