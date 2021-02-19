import 'package:flutter/cupertino.dart';
import 'package:todoey/models/task.dart';
import 'dart:collection';

class TasksNotifierProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int countnotdone() {
    int counter = 0;
    for (Task task in _tasks) {
      if (!task.isDone) {
        counter++;
      }
    }
    return counter;
  }

  int count() {
    return _tasks.length;
  }

  void addtask(String name) {
    _tasks.add(Task(name: name));
    notifyListeners();
  }

  void removetask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }
}
