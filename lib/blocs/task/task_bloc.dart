import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plan_it_app/services/hive_service.dart';

import '../../models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final HiveService hiveService = HiveService();
  TaskBloc() : super(TaskState()) {
    on<CreateNewTask>(_mapCreateNewTaskToState);
    on<GetTasks>(_mapGetTasksToState);
    on<UpdateTask>(_mapUpdateTaskToState);
    on<DeleteTask>(_mapDeleteTaskToState);
  }

  Future<void> _mapCreateNewTaskToState(
      CreateNewTask event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true));
    hiveService.addTask(event.newTask);
    final List<TaskModel> fetchedTasks = hiveService.getTask();
    emit(state.copyWith(isLoading: false, fetchedTasks: fetchedTasks));
  }

  Future<void> _mapGetTasksToState(
      GetTasks event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true));
    final List<TaskModel> fetchedTasks = hiveService.getTask();
    emit(state.copyWith(isLoading: false, fetchedTasks: fetchedTasks));
  }

  Future<void> _mapUpdateTaskToState(
      UpdateTask event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true));
    hiveService.updateTask(event.index, event.updatedTask);
    final List<TaskModel> updatedTasks = hiveService.getTask();
    emit(state.copyWith(
        isLoading: false, isUpdated: true, fetchedTasks: updatedTasks));
    emit(state.copyWith(isUpdated: false));
  }

  Future<void> _mapDeleteTaskToState(
      DeleteTask event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true));
    hiveService.deleteTask(event.index);
    final List<TaskModel> updatedTasks = hiveService.getTask();
    emit(state.copyWith(
        isLoading: false, isDeleted: true, fetchedTasks: updatedTasks));
    emit(state.copyWith(isDeleted: false));
  }
}
