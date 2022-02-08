import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_task/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  // UnmodifiableListView<Task> get tasks {
  //   return UnmodifiableListView(_tasks);
  // }
  List<Task> get tasks {
    return [..._tasks];
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle, isDone: false);
    if (newTaskTitle == '') {
    } else {
      _tasks.add(task);
    }
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
