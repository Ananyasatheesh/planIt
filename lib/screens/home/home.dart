import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plan_it_app/blocs/task/task_bloc.dart';
import 'package:plan_it_app/models/task_model.dart';
import 'package:plan_it_app/screens/calendar/calendar.dart';
import 'package:plan_it_app/screens/stats/stats.dart';
import 'home_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController taskTitleController = TextEditingController();

  void _showDialogToAddNewTask(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Create new task"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: taskTitleController,
                  decoration: InputDecoration(hintText: "Title"),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.white)),
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<TaskBloc>().add(CreateNewTask(
                          newTask: TaskModel(task: taskTitleController.text)));
                      taskTitleController.clear();
                    },
                    child: Text("Set"))
              ],
            ),
          );
        });
  }

  int selectedIndex = 0;
  final List<Widget> widgetOptions = [HomeScreen(), Calendar(), Stats()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x1AFFFFFF),
        leading: Icon(Icons.settings),
        actions: [Icon(Icons.person)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialogToAddNewTask(context);
        },
        child: Icon(Icons.add),
      ),
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10.0),
        child: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: false,
            elevation: 0,
            backgroundColor: Color(0x1AFFFFFF),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            currentIndex: selectedIndex,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_rounded), label: "Calendar"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart_rounded), label: "Analytics")
            ]),
      ),
    );
  }
}
