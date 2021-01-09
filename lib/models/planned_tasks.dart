
import 'package:flutter/foundation.dart';
import 'package:todo_provider/models/task.dart';

class PlannedTasks extends ChangeNotifier {
  final List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  int length() {
    return tasks.length;
  }

  void deleteTask() {
    tasks.clear();
    notifyListeners();
  }

  
}