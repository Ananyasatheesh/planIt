import 'package:hive_flutter/adapters.dart';

part 'task_model.g.dart';
@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String? task;

  TaskModel({this.task});
}
