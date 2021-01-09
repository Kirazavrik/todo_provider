import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/planned_tasks.dart';
import 'package:todo_provider/views/task_add_view.dart';

class TasksView extends StatelessWidget {
  final TaskAddView taskAddView = TaskAddView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
      ),
      body: Consumer<PlannedTasks>(
        builder: (context, plannedTasks, child) {
          return Container(
            child: ListView.builder(
                padding: EdgeInsets.all(6),
                itemCount: plannedTasks.length(),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(plannedTasks.tasks[index].taskText),
                      trailing: Icon(Icons.more_vert),
                      onTap: () {},
                    ),
                  );
                }),
          );
        }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TaskAddView())
          );
        },
      ),
    );
  }
}
