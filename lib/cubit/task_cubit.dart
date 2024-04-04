import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:uptodo_with_bloc/data/shared_prefs_class.dart';
import 'package:uptodo_with_bloc/data/task_class.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  List<Task> tasks = [];

  List<Task> getAllTasks() {
    SharedPrefs().getData().then((tasks) {
      emit(TasksLoaded(tasks: tasks));
      this.tasks = tasks;
    });
    return tasks;
  }
}
