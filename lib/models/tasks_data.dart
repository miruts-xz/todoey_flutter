import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _taskLists = [
    Task(name: "Buy milk"),
    Task(name: "Buy bread"),
    Task(name: "Buy eggs"),
  ];

  UnmodifiableListView<Task> get taskLists => UnmodifiableListView(_taskLists);

  int get taskCount => _taskLists.length;

  void addTask(String taskTitle) {
    _taskLists.add(Task(name: taskTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _taskLists.remove(task);
    notifyListeners();
  }
}
