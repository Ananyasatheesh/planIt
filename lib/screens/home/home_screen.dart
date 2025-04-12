import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: ListTile(
        title: Text("Task name"),
        tileColor: Color(0x1AFFFFFF),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                // todo action for updating task
              },
              icon: Icon(
                Icons.edit,
                size: 20,
              ),
            ),
            IconButton(
              onPressed: () {
                // todo action for deleting tasky
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
  }
}
