import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_it_app/blocs/task/task_bloc.dart';
import 'package:plan_it_app/models/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<TaskBloc>().add(GetTasks());
    super.initState();
  }

  _updateTask(
    int index,
    TaskModel existingTask,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          final newValue = TextEditingController(text: existingTask.task);
          return AlertDialog(
            title: TextField(
              controller: newValue,
            ),
            actions: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.white)),
                  onPressed: () {
                    final updatedTask = TaskModel(task: newValue.text);
                    context.read<TaskBloc>().add(
                        UpdateTask(index: index, updatedTask: updatedTask));
                    Navigator.pop(context);
                  },
                  child: Text("Update task"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.builder(
            itemCount: state.fetchedTasks.length,
            itemBuilder: (BuildContext context, index) {
              final existingTask = state.fetchedTasks[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: ListTile(
                  title: Text("${existingTask.task}"),
                  tileColor: Color(0x1AFFFFFF),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          _updateTask(index, existingTask);
                        },
                        icon: Icon(
                          Icons.edit,
                          size: 20,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read<TaskBloc>()
                              .add(DeleteTask(index: index));
                        },
                        icon: Icon(
                          Icons.delete,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
