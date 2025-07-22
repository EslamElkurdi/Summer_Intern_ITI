import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/cubit/todo_cubit/todo_cubit.dart';
import 'package:iti_flutter/cubit/todo_cubit/todo_state.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoCubit = TodoCubit();

    return Scaffold(
      appBar: AppBar(title: Text("To-do List")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(hintText: "Enter Task"),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_taskController.text.trim().isNotEmpty) {
                      todoCubit.addTodo(_taskController.text.trim());
                      _taskController.clear();
                    }
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),

          Expanded(
            child: BlocBuilder<TodoCubit, TodoState>(
              builder: (context, state) {
                if (state is TodoLoaded) {
                  if (state.todos.isEmpty) {
                    return Center(child: Text("No tasks yet"));
                  }

                  return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      final todo = state.todos[index];

                      return ListTile(
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration:
                                todo.isDone ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        leading: Checkbox(
                          value: todo.isDone,
                          onChanged: (value) => todoCubit.toggleDone(todo.id),
                        ),
                        trailing: IconButton(
                          onPressed: () => todoCubit.deleteTodo(todo.id),
                          icon: Icon(Icons.delete),
                        ),
                      );
                    },
                  );
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
