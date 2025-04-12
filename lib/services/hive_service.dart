import 'package:hive_flutter/adapters.dart';
import 'package:plan_it_app/models/task_model.dart';

class HiveService {
  final Box<TaskModel> _taskBox = Hive.box('tasksBox');

  void addTask(TaskModel task) {
    _taskBox.add(task);
  }

  List<TaskModel> getTask() {
    return _taskBox.values.toList();
  }

  void deleteTask(int index) {
    _taskBox.deleteAt(index);
  }

  void updateTask(int index, TaskModel task) {
    _taskBox.putAt(index, task);
  }
}
