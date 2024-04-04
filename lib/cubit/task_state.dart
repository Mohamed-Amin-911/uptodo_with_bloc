part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class TasksLoaded extends TaskState {
  final List<Task> tasks;
  TasksLoaded({required this.tasks});
}
