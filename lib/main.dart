
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/planned_tasks.dart';
import 'package:todo_provider/views/firebase_test_view.dart';
import 'package:todo_provider/views/tasks_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PlannedTasks(),
      child: ToDoApp(),
    )
  );
}

class ToDoApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: TestView(),
    );
  }

}