import 'package:flutter/material.dart';
import 'package:plan_it_app/core/theme/app_theme.dart';
import 'package:plan_it_app/screens/home/home.dart';

void main() async{
  runApp(PlanIt());
}

class PlanIt extends StatelessWidget {
  const PlanIt({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: AppTheme.appTheme,
    );
  }
}


