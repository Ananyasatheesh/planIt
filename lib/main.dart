import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:plan_it_app/blocs/task/task_bloc.dart';
import 'package:plan_it_app/core/theme/app_theme.dart';
import 'package:plan_it_app/models/task_model.dart';
import 'package:plan_it_app/screens/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasksBox');
  runApp(PlanIt());
}

class PlanIt extends StatelessWidget {
  const PlanIt({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => TaskBloc())],
      child: MaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: Home(),
        theme: AppTheme.appTheme,
      ),
    );
  }
}
