import 'dart:collection';

class Task {
  bool isDone;
  final String name;
  final int id;

  Task({this.id, this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        isDone = json['isDone'];

  Map toJson() => {
        'id': id,
        'name': name,
        'isDone': isDone,
      };
}

class AppState {
  final List<Task> _tasks;

  int get taskCount => _tasks.length;

  List<Task> get tasks => UnmodifiableListView(_tasks);

  AppState({List<Task> tasks}) : _tasks = tasks;

  factory AppState.initialState() => AppState(
        tasks: List.unmodifiable([]),
      );

  AppState.fromJson(Map<String, dynamic> json)
      : _tasks = (json['tasks'] as List).map((t) => Task.fromJson(t)).toList();

  Map toJson() => {
        'tasks': tasks,
      };
}
