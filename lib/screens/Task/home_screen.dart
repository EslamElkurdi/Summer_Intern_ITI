import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/cubit/tasks_cubit/auth/auth_cubit.dart';
import 'package:iti_flutter/cubit/tasks_cubit/task/task_cubit.dart';
import 'package:iti_flutter/cubit/tasks_cubit/task/task_state.dart';
import 'package:iti_flutter/cubit/todo_cubit/todo_cubit.dart';
import 'package:iti_flutter/screens/Task/login_screen.dart';

class HomeScreenTask extends StatefulWidget {
  HomeScreenTask({super.key});

  @override
  State<HomeScreenTask> createState() => _HomeScreenTaskState();
}

class _HomeScreenTaskState extends State<HomeScreenTask> {
  final taskController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<TaskCubit>().fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    final taskCubit = context.read<TaskCubit>();
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text("My Tasks"),

        actions: [
          IconButton(
            onPressed: () {
              authCubit.logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(hintText: "Enter Task"),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (taskController.text.trim().isNotEmpty) {
                      taskCubit.addTask(taskController.text.trim());
                      taskController.clear();
                    }
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),

          Expanded(
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                if (state is TaskLoaded) {
                  if (state.tasks.isEmpty) {
                    return Center(child: Text("No tasks yet"));
                  }
                  return ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      final task = state.tasks[index];
                      return ListTile(
                        leading: Checkbox(
                          value: task.isDone,
                          onChanged: (value) => taskCubit.toggleTask(task),
                        ),

                        title: Text(
                          task.title,
                          style: TextStyle(
                            decoration:
                                task.isDone ? TextDecoration.lineThrough : null,
                          ),
                        ),

                        trailing: IconButton(
                          onPressed: () => taskCubit.deleteTask(task.id),
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
