import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:uptodo_with_bloc/data/task_class.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial()) {
    readFromSp();
  }

  List<Task> tasks = List.empty(growable: true);

  saveIntoSp(Task task) async {
    tasks.add(task);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskListString =
        tasks.map((contact) => jsonEncode(contact.toJson())).toList();
    prefs.setStringList('myData', taskListString);
    List<String>? contactListString = prefs.getStringList('myData');
    if (contactListString != null) {
      List<Task> taskss = contactListString
          .map((contact) => Task.fromJson(json.decode(contact)))
          .toList();
      emit(TasksLoaded(tasks: taskss));
      return taskss;
    } else {
      emit(TasksLoaded(tasks: []));
    }
  }

  readFromSp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? contactListString = prefs.getStringList('myData');
    if (contactListString != null) {
      List<Task> taskss = contactListString
          .map((contact) => Task.fromJson(json.decode(contact)))
          .toList();
      emit(TasksLoaded(tasks: taskss));
      return taskss;
    } else {
      emit(TasksLoaded(tasks: []));
    }
  }
}
