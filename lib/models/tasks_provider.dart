import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoey/models/task.dart';
import 'dart:collection';
import 'package:todoey/utils/database.dart';

class TasksNotifierProvider extends ChangeNotifier {
  List<Task> _tasks = [];

  DatabaseProvider databasepv = DatabaseProvider();

  Future<bool> loaddatabase() async {
    _tasks = await databasepv.readDatabase();
    notifyListeners();
    return true;
  }

  Future<int> generateid() async {
    return await databasepv.queryRowCount() + 1;
  }

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

  void addtask(String name) async {
    int id = await generateid();
    Task task = Task(name: name, id: id);
    _tasks.add(task);
    notifyListeners();
    databasepv.insertTask(task);
  }

  void removetask(int index) {
    Task task = _tasks[index];
    _tasks.remove(task);
    notifyListeners();
    databasepv.deleteTask(task.id);
  }

  void toggleTask(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
    databasepv.updateTask(_tasks[index]);
  }

  void clearTasks() async {
    _tasks.clear();
    notifyListeners();
    await databasepv.clearDatabase();
  }
}
