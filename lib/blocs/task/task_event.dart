part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class CreateNewTask extends TaskEvent {
  final TaskModel newTask;

  const CreateNewTask({required this.newTask});
  @override
  List<Object?> get props => [newTask];
}

class GetTasks extends TaskEvent {
  @override
  List<Object?> get props => [];
}

class UpdateTask extends TaskEvent {
  final int index;
  final TaskModel updatedTask;

  const UpdateTask({required this.index, required this.updatedTask});
  @override
  List<Object?> get props => [index, updatedTask];
}

class DeleteTask extends TaskEvent {
  final int index;

  const DeleteTask({required this.index});
  @override
  List<Object?> get props => [index];
}
