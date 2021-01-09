import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/planned_tasks.dart';
import 'package:todo_provider/models/task.dart';

class TaskAddView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    String taskText;
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: TextField(
        onChanged: (text) {
          taskText = text;
        },
        onEditingComplete: () {
          Provider.of<PlannedTasks>(context, listen: false).addTask(Task(taskText: taskText));
        },
      ),
    );
  }

}