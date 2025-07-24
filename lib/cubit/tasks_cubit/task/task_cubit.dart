import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter/cubit/tasks_cubit/auth/auth_cubit.dart';
import 'package:iti_flutter/cubit/tasks_cubit/task/task_state.dart';
import 'package:iti_flutter/models/task.dart';

class TaskCubit extends Cubit<TaskState> {
  static final TaskCubit _instance = TaskCubit._internal();
  factory TaskCubit() => _instance;
  TaskCubit._internal() : super(TaskIntial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> fetchTasks() async {
    final uid = AuthCubit().currentUser?.uid;

    final snapshot =
        await _firestore.collection('users').doc(uid).collection('tasks').get();

    final tasks =
        snapshot.docs
            .map((doc) => TaskModel.fromMap(doc.id, doc.data()))
            .toList();

    emit(TaskLoaded(tasks));
  }

  Future<void> addTask(String title) async {
    final uid = AuthCubit().currentUser?.uid;
    final doc = await _firestore
        .collection('users')
        .doc(uid)
        .collection('tasks')
        .add({'title': title, 'isDone': false});

    fetchTasks();
  }

  Future<void> toggleTask(TaskModel task) async {
    final uid = AuthCubit().currentUser?.uid;
    await _firestore
        .collection('users')
        .doc(uid)
        .collection('tasks')
        .doc(task.id)
        .update({'isDone': !task.isDone});

    fetchTasks();
  }

  Future<void> deleteTask(String id) async {
    final uid = AuthCubit().currentUser?.uid;

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('tasks')
        .doc(id)
        .delete();

    fetchTasks();
  }
}
