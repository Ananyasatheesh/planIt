part of 'task_bloc.dart';

class TaskState extends Equatable {
  final bool isLoading;
  final List<TaskModel> fetchedTasks;
  final bool isUpdated;
  final bool isDeleted;
  const TaskState({
    this.isLoading = false,
    this.fetchedTasks = const [],
    this.isUpdated = false,
    this.isDeleted = false,
  });

  TaskState copyWith({
    bool? isLoading,
    List<TaskModel>? fetchedTasks,
    bool? isUpdated,
    bool? isDeleted,
  }) {
    return TaskState(
      isLoading: isLoading ?? this.isLoading,
      fetchedTasks: fetchedTasks ?? this.fetchedTasks,
      isUpdated: isUpdated ?? this.isUpdated,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  List<Object> get props => [isLoading, fetchedTasks, isUpdated, isDeleted];
}
