import 'package:flutter/foundation.dart';
import 'package:todoeyflutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
//  int name; // this is an example

  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  // unmodifiable list not a practical ListView.
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  // getter method in Dart.
  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newText) {
    _tasks.add(Task(name: newText));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  // or can use this, removing by object instead of index.
//void deleteTask(Task task) {
//    _tasks.remove(task);
//    notifyListeners();
//}

//  set task(int name) => this.name = name; // this is an example.
}
